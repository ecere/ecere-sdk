.PHONY: all objdir cleantarget clean realclean distclean pots

# CORE VARIABLES

MODULE := Installer
VERSION := 
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

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/setup-ecere-0.44.15-win32$(E)

_ECSOURCES = \
	../ide/src/IDESettings.ec \
	../ide/src/OldIDESettings.ec \
	src/installer.ec \
	../extras/gui/controls/StringsBox.ec \
	../ide/src/licensing.ec \
	../extras/createLink.ec \
	../extras/gui/controls/CheckListBox.ec

ECSOURCES = $(call shwspace,$(_ECSOURCES))

_COBJECTS = $(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES))))

_SYMBOLS = $(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES))))

_IMPORTS = $(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES))))

_ECOBJECTS = $(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES))))

_BOWLS = $(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES))))

COBJECTS = $(call shwspace,$(_COBJECTS))

SYMBOLS = $(call shwspace,$(_SYMBOLS))

IMPORTS = $(call shwspace,$(_IMPORTS))

ECOBJECTS = $(call shwspace,$(_ECOBJECTS))

BOWLS = $(call shwspace,$(_BOWLS))

ifdef WINDOWS_TARGET

_RCSOURCES = \
	../ide/src/resources.rc

RCSOURCES = $(call shwspace,$(_RCSOURCES))

RCOBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.rc,%$(O),$(notdir $(_RCSOURCES)))))

else
RCSOURCES =
RCOBJECTS =
endif

OBJECTS = $(ECOBJECTS) $(OBJ)$(MODULE).main$(O) $(RCOBJECTS)

SOURCES = $(ECSOURCES) $(RCSOURCES)

RESOURCES = $(RESOURCES1) $(RESOURCES2) $(RESOURCES3) $(RESOURCES4) $(RESOURCES5) $(RESOURCES6) $(RESOURCES7) $(RESOURCES8) $(RESOURCES9) $(RESOURCES10) $(RESOURCES11) $(RESOURCES12) $(RESOURCES13) $(RESOURCES14) $(RESOURCES15) $(RESOURCES16) $(RESOURCES17) $(RESOURCES18) $(RESOURCES19) $(RESOURCES20) $(RESOURCES21) $(RESOURCES22) $(RESOURCES23) $(RESOURCES24) $(RESOURCES25) $(RESOURCES26) $(RESOURCES27) $(RESOURCES28) $(RESOURCES29) $(RESOURCES30) $(RESOURCES31) $(RESOURCES32) $(RESOURCES33) $(RESOURCES34) $(RESOURCES35) $(RESOURCES36) $(RESOURCES37) $(RESOURCES38) $(RESOURCES39) $(RESOURCES40) $(RESOURCES41) $(RESOURCES42) $(RESOURCES43) $(RESOURCES44) $(RESOURCES45) $(RESOURCES46) $(RESOURCES47) $(RESOURCES48) $(RESOURCES49) $(RESOURCES50) $(RESOURCES51) $(RESOURCES52) $(RESOURCES53) $(RESOURCES54) $(RESOURCES55) $(RESOURCES56) $(RESOURCES57) $(RESOURCES58) $(RESOURCES59) $(RESOURCES60) $(RESOURCES61) $(RESOURCES62) $(RESOURCES63) $(RESOURCES64) $(RESOURCES65) $(RESOURCES66) $(RESOURCES67) $(RESOURCES68) $(RESOURCES69) $(RESOURCES70) $(RESOURCES71) $(RESOURCES72) $(RESOURCES73) $(RESOURCES74) $(RESOURCES75) $(RESOURCES76) $(RESOURCES77) $(RESOURCES78) $(RESOURCES79) $(RESOURCES80) $(RESOURCES81) $(RESOURCES82) $(RESOURCES83) $(RESOURCES84) $(RESOURCES85) $(RESOURCES86) $(RESOURCES87) $(RESOURCES88) $(RESOURCES89) $(RESOURCES90) $(RESOURCES91) $(RESOURCES92) $(RESOURCES93) $(RESOURCES94) $(RESOURCES95) $(RESOURCES96) $(RESOURCES97) $(RESOURCES98) $(RESOURCES99) $(RESOURCES100) $(RESOURCES101) $(RESOURCES102) $(RESOURCES103) $(RESOURCES104) $(RESOURCES105) $(RESOURCES106) $(RESOURCES107) $(RESOURCES108) $(RESOURCES109) $(RESOURCES110) $(RESOURCES111) $(RESOURCES112) $(RESOURCES113) $(RESOURCES114) $(RESOURCES115) $(RESOURCES116) $(RESOURCES117) $(RESOURCES118) $(RESOURCES119) $(RESOURCES120) $(RESOURCES121) $(RESOURCES122) $(RESOURCES123) $(RESOURCES124) $(RESOURCES125) $(RESOURCES126) $(RESOURCES127) $(RESOURCES128) $(RESOURCES129) $(RESOURCES130) $(RESOURCES131) $(RESOURCES132) $(RESOURCES133) $(RESOURCES134) $(RESOURCES135) $(RESOURCES136) $(RESOURCES137) $(RESOURCES138) $(RESOURCES139) $(RESOURCES140) $(RESOURCES141) $(RESOURCES142) $(RESOURCES143) $(RESOURCES144) $(RESOURCES145) $(RESOURCES146) $(RESOURCES147) $(RESOURCES148) $(RESOURCES149) $(RESOURCES150) $(RESOURCES151) $(RESOURCES152) $(RESOURCES153) $(RESOURCES154) $(RESOURCES155) $(RESOURCES156) $(RESOURCES157) $(RESOURCES158) $(RESOURCES159) $(RESOURCES160) $(RESOURCES161) $(RESOURCES162) $(RESOURCES163) $(RESOURCES164) $(RESOURCES165) $(RESOURCES166) $(RESOURCES167) $(RESOURCES168) $(RESOURCES169) $(RESOURCES170) $(RESOURCES171) $(RESOURCES172) $(RESOURCES173) $(RESOURCES174) $(RESOURCES175) $(RESOURCES176) $(RESOURCES177) $(RESOURCES178) $(RESOURCES179) $(RESOURCES180) $(RESOURCES181) $(RESOURCES182) $(RESOURCES183) $(RESOURCES184) $(RESOURCES185) $(RESOURCES186) $(RESOURCES187) $(RESOURCES188) $(RESOURCES189) $(RESOURCES190) $(RESOURCES191) $(RESOURCES192) $(RESOURCES193) $(RESOURCES194) $(RESOURCES195) $(RESOURCES196) $(RESOURCES197) $(RESOURCES198) $(RESOURCES199) $(RESOURCES200) $(RESOURCES201) $(RESOURCES202) $(RESOURCES203) $(RESOURCES204) $(RESOURCES205) $(RESOURCES206) $(RESOURCES207) $(RESOURCES208) $(RESOURCES209) $(RESOURCES210) $(RESOURCES211) $(RESOURCES212) $(RESOURCES213) $(RESOURCES214) $(RESOURCES215) $(RESOURCES216) $(RESOURCES217) $(RESOURCES218) $(RESOURCES219) $(RESOURCES220) $(RESOURCES221) $(RESOURCES222) $(RESOURCES223) $(RESOURCES224) $(RESOURCES225) $(RESOURCES226) $(RESOURCES227) $(RESOURCES228) $(RESOURCES229) $(RESOURCES230) $(RESOURCES231) $(RESOURCES232) $(RESOURCES233) $(RESOURCES234) $(RESOURCES235) $(RESOURCES236) $(RESOURCES237) $(RESOURCES238) $(RESOURCES239) $(RESOURCES240) $(RESOURCES241) $(RESOURCES242) $(RESOURCES243) $(RESOURCES244) $(RESOURCES245) $(RESOURCES246) $(RESOURCES247) $(RESOURCES248) $(RESOURCES249) $(RESOURCES250) $(RESOURCES251) $(RESOURCES252) $(RESOURCES253) $(RESOURCES254) $(RESOURCES255) $(RESOURCES256) $(RESOURCES257) $(RESOURCES258) $(RESOURCES259) $(RESOURCES260) $(RESOURCES261) $(RESOURCES262) $(RESOURCES263) $(RESOURCES264) $(RESOURCES265) $(RESOURCES266) $(RESOURCES267) $(RESOURCES268) $(RESOURCES269) $(RESOURCES270) $(RESOURCES271) $(RESOURCES272) $(RESOURCES273) $(RESOURCES274) $(RESOURCES275) $(RESOURCES276) $(RESOURCES277) $(RESOURCES278) $(RESOURCES279) $(RESOURCES280) $(RESOURCES281) $(RESOURCES282) $(RESOURCES283) $(RESOURCES284) $(RESOURCES285) $(RESOURCES286) $(RESOURCES287) $(RESOURCES288) $(RESOURCES289) $(RESOURCES290) $(RESOURCES291) $(RESOURCES292) $(RESOURCES293) $(RESOURCES294) $(RESOURCES295) $(RESOURCES296)
RESOURCES1 = \
	../ecere/res/elements/areaClose.png \
	../ecere/res/elements/areaMaximize.png \
	../ecere/res/elements/areaMinimize.png \
	../ecere/res/elements/areaRestore.png \
	../ecere/res/elements/arrowDown.png \
	../ecere/res/elements/arrowLeft.png \
	../ecere/res/elements/arrowRight.png \
	../ecere/res/elements/arrowUp.png \
	../ecere/res/unicode/derivedGeneralCategoryStripped.txt \
	../ecere/res/actions/folderNew.png \
	../ecere/res/actions/goUp.png \
	../ecere/res/devices/computer.png \
	../ecere/res/devices/driveHardDisk.png \
	../ecere/res/devices/driveRemovableMedia.png \
	../ecere/res/devices/mediaFloppy.png \
	../ecere/res/devices/mediaOptical.png \
	../ecere/res/mimeTypes/file.png \
	../ecere/res/mimeTypes/brokenFile.png \
	../ecere/res/places/driveRemote.png \
	../ecere/res/places/folder.png \
	../ecere/res/places/folderRemote.png \
	../ecere/res/places/networkServer.png \
	../ecere/res/places/networkWorkgroup.png \
	../ecere/res/places/brokenFolder.png \
	../ecere/res/status/folderOpen.png \
	../ecere/locale/es.mo \
	../ecere/locale/hu.mo \
	../ecere/locale/mr.mo \
	../ecere/locale/nl.mo \
	../ecere/locale/pt_BR.mo \
	../ecere/locale/ru.mo \
	../ecere/locale/zh_CN.mo \
	../obj/win32/bin/documentor.exe \
	../obj/win32/bin/ecere-ide.exe \
	../obj/win32/bin/ear.exe \
	../obj/win32/bin/ec.dll \
	../obj/win32/bin/ecc.exe \
	../obj/win32/bin/ecereCOM.dll \
	../obj/win32/bin/ecp.exe \
	../obj/win32/bin/ecs.exe \
	../obj/win32/bin/epj2make.exe \
	../obj/win32/bin/EDA.dll \
	../obj/win32/bin/EDASQLite.dll \
	../doc/ecere/ecere/com/AccessMode.econ
RESOURCES2 = \
	../doc/ecere/ecere/com/Angle.econ \
	../doc/ecere/ecere/com/Array.econ \
	../doc/ecere/ecere/com/AVLNode.econ \
	../doc/ecere/ecere/com/AVLTree.econ \
	../doc/ecere/ecere/com/BitMember.econ \
	../doc/ecere/ecere/com/BTNamedLink.econ \
	../doc/ecere/ecere/com/BuiltInContainer.econ \
	../doc/ecere/ecere/com/Class.econ \
	../doc/ecere/ecere/com/ClassDesignerBase.econ \
	../doc/ecere/ecere/com/ClassProperty.econ \
	../doc/ecere/ecere/com/ClassTemplateArgument.econ \
	../doc/ecere/ecere/com/ClassTemplateParameter.econ \
	../doc/ecere/ecere/com/ClassType.econ \
	../doc/ecere/ecere/com/Container.econ \
	../doc/ecere/ecere/com/CustomAVLTree.econ \
	../doc/ecere/ecere/com/DataMember.econ \
	../doc/ecere/ecere/com/DataMemberType.econ \
	../doc/ecere/ecere/com/DataValue.econ \
	../doc/ecere/ecere/com/DefinedExpression.econ \
	../doc/ecere/ecere/com/DesignerBase.econ \
	../doc/ecere/ecere/com/EnumClassData.econ \
	../doc/ecere/ecere/com/GlobalFunction.econ \
	../doc/ecere/ecere/com/ImportType.econ \
	../doc/ecere/ecere/com/IOChannel.econ \
	../doc/ecere/ecere/com/Iterator.econ \
	../doc/ecere/ecere/com/IteratorPointer.econ \
	../doc/ecere/ecere/com/Link.econ \
	../doc/ecere/ecere/com/LinkElement.econ \
	../doc/ecere/ecere/com/LinkList.econ \
	../doc/ecere/ecere/com/List.econ \
	../doc/ecere/ecere/com/ListItem.econ \
	../doc/ecere/ecere/com/Map.econ \
	../doc/ecere/ecere/com/MapIterator.econ \
	../doc/ecere/ecere/com/MapNode.econ \
	../doc/ecere/ecere/com/Method.econ \
	../doc/ecere/ecere/com/MethodType.econ
RESOURCES3 = \
	../doc/ecere/ecere/com/NameSpace.econ \
	../doc/ecere/ecere/com/ObjectInfo.econ \
	../doc/ecere/ecere/com/Platform.econ \
	../doc/ecere/ecere/com/Property.econ \
	../doc/ecere/ecere/com/SerialBuffer.econ \
	../doc/ecere/ecere/com/StaticString.econ \
	../doc/ecere/ecere/com/SubModule.econ \
	../doc/ecere/ecere/com/TemplateMemberType.econ \
	../doc/ecere/ecere/com/TemplateParameterType.econ \
	../doc/ecere/ecere/com/_global-defs.econ \
	../doc/ecere/ecere/gfx/drivers/Font.econ \
	../doc/ecere/ecere/gfx/drivers/_global-defs.econ \
	../doc/ecere/ecere/gfx/Bitmap.econ \
	../doc/ecere/ecere/gfx/BitmapResource.econ \
	../doc/ecere/ecere/gfx/Color.econ \
	../doc/ecere/ecere/gfx/Color444.econ \
	../doc/ecere/ecere/gfx/Color555.econ \
	../doc/ecere/ecere/gfx/Color565.econ \
	../doc/ecere/ecere/gfx/ColorAlpha.econ \
	../doc/ecere/ecere/gfx/ColorCMYK.econ \
	../doc/ecere/ecere/gfx/ColorHSV.econ \
	../doc/ecere/ecere/gfx/ColorKey.econ \
	../doc/ecere/ecere/gfx/ColorLab.econ \
	../doc/ecere/ecere/gfx/ColorRGB.econ \
	../doc/ecere/ecere/gfx/ColorRGBA.econ \
	../doc/ecere/ecere/gfx/ColorRGBAf.econ \
	../doc/ecere/ecere/gfx/CubeMap.econ \
	../doc/ecere/ecere/gfx/DefinedColor.econ \
	../doc/ecere/ecere/gfx/Display.econ \
	../doc/ecere/ecere/gfx/DisplayDriver.econ \
	../doc/ecere/ecere/gfx/DisplaySystem.econ \
	../doc/ecere/ecere/gfx/Font.econ \
	../doc/ecere/ecere/gfx/FontResource.econ \
	../doc/ecere/ecere/gfx/Resource.econ \
	../doc/ecere/ecere/gfx/Surface.econ \
	../doc/ecere/ecere/gfx/_global-defs.econ
RESOURCES4 = \
	../doc/ecere/ecere/gfx3D/meshes/_global-defs.econ \
	../doc/ecere/ecere/gfx3D/_global-defs.econ \
	../doc/ecere/ecere/gui/controls/BufferLocation.econ \
	../doc/ecere/ecere/gui/controls/DropBox.econ \
	../doc/ecere/ecere/gui/controls/EditBox.econ \
	../doc/ecere/ecere/gui/controls/Label.econ \
	../doc/ecere/ecere/gui/controls/_global-defs.econ \
	../doc/ecere/ecere/gui/dialogs/_global-defs.econ \
	../doc/ecere/ecere/gui/skins/_global-defs.econ \
	../doc/ecere/ecere/gui/Anchor.econ \
	../doc/ecere/ecere/gui/BorderStyle.econ \
	../doc/ecere/ecere/gui/Key.econ \
	../doc/ecere/ecere/gui/KeyCode.econ \
	../doc/ecere/ecere/gui/Percentage.econ \
	../doc/ecere/ecere/gui/PredefinedKey.econ \
	../doc/ecere/ecere/gui/Timer.econ \
	../doc/ecere/ecere/gui/Window.econ \
	../doc/ecere/ecere/gui/_global-defs.econ \
	../doc/ecere/ecere/net/DCOMClientObject.econ \
	../doc/ecere/ecere/net/DCOMServerObject.econ \
	../doc/ecere/ecere/net/DCOMServerSocket.econ \
	../doc/ecere/ecere/net/DCOMService.econ \
	../doc/ecere/ecere/net/FileServerConnection.econ \
	../doc/ecere/ecere/net/HTTPFile.econ \
	../doc/ecere/ecere/net/NetworkClientFile.econ \
	../doc/ecere/ecere/net/Packet.econ \
	../doc/ecere/ecere/net/Service.econ \
	../doc/ecere/ecere/net/Socket.econ \
	../doc/ecere/ecere/net/SSLSocket.econ \
	../doc/ecere/ecere/net/_global-defs.econ \
	../doc/ecere/ecere/sys/File.econ \
	../doc/ecere/ecere/sys/FileListing.econ \
	../doc/ecere/ecere/sys/NamedLink64.econ \
	../doc/ecere/ecere/sys/Point.econ
RESOURCES5 = \
	../doc/ecere/ecere/sys/Pointf.econ \
	../doc/ecere/ecere/sys/_global-defs.econ \
	../doc/ecere/ecere/_global-defs.econ \
	../doc/ecere/unichar.econ \
	../doc/ecere/_global-defs.econ \
	../doc/ecereCOM/ecere/com/Application.econ \
	../doc/ecereCOM/ecere/com/Instance.econ \
	../doc/ecereCOM/ecere/com/Module.econ \
	../doc/ecereCOM/ecere/com/_global-defs.econ \
	../doc/ecereCOM/ecere/sys/_global-defs.econ \
	../doc/ecereCOM/ecere/_global-defs.econ \
	../doc/ecereCOM/bool.econ \
	../doc/ecereCOM/byte.econ \
	../doc/ecereCOM/char-pointer.econ \
	../doc/ecereCOM/char.econ \
	../doc/ecereCOM/class.econ \
	../doc/ecereCOM/double.econ \
	../doc/ecereCOM/enum.econ \
	../doc/ecereCOM/float.econ \
	../doc/ecereCOM/int.econ \
	../doc/ecereCOM/int64.econ \
	../doc/ecereCOM/intptr.econ \
	../doc/ecereCOM/intsize.econ \
	../doc/ecereCOM/short.econ \
	../doc/ecereCOM/String.econ \
	../doc/ecereCOM/struct.econ \
	../doc/ecereCOM/uint.econ \
	../doc/ecereCOM/uint16.econ \
	../doc/ecereCOM/uint32.econ \
	../doc/ecereCOM/uint64.econ \
	../doc/ecereCOM/uintptr.econ \
	../doc/ecereCOM/uintsize.econ \
	../doc/ecereCOM/unsigned-int.econ \
	../doc/ecereCOM/_global-defs.econ \
	../doc/EDA/eda/MoveOptions.econ \
	../doc/EDA/eda/_global-defs.econ \
	../share/man/man1/documentor.1 \
	../share/man/man1/ear.1 \
	../share/man/man1/ecc.1 \
	../share/man/man1/ecere-ide.1 \
	../share/man/man1/ecp.1 \
	../share/man/man1/ecs.1 \
	../share/man/man1/epj2make.1 \
	../LICENSE \
	../README.md \
	../doc/tao.pdf \
	../doc/tao.pdf
RESOURCES6 = \
	coursework/Chapter\ 1\ -\ Getting\ Started/Lab1.1/helloWorld.ec \
	coursework/Chapter\ 1\ -\ Getting\ Started/Lab1.1/HelloWorld.epj \
	coursework/Chapter\ 1\ -\ Getting\ Started/Lab1.2/form1.ec \
	coursework/Chapter\ 1\ -\ Getting\ Started/Lab1.2/HelloForm.epj \
	coursework/Chapter\ 1\ -\ Getting\ Started/answers\ -\ chapter\ 1.odt \
	coursework/Chapter\ 1\ -\ Getting\ Started/exercises\ -\ chapter\ 1.odt \
	coursework/Chapter\ 2\ -\ Variables\ and\ Data\ Types/Lab2.4/lab2.ec \
	coursework/Chapter\ 2\ -\ Variables\ and\ Data\ Types/Lab2.4/Lab2.epj \
	coursework/Chapter\ 2\ -\ Variables\ and\ Data\ Types/Lab2.5/variables.ec \
	coursework/Chapter\ 2\ -\ Variables\ and\ Data\ Types/Lab2.5/VariablesApp.epj \
	coursework/Chapter\ 2\ -\ Variables\ and\ Data\ Types/answers\ -\ chapter\ 2.odt \
	coursework/Chapter\ 2\ -\ Variables\ and\ Data\ Types/exercises\ -\ chapter\ 2.odt \
	coursework/Chapter\ 3\ -\ Operators/Lab3/lab3.ec \
	coursework/Chapter\ 3\ -\ Operators/Lab3/Lab3.epj \
	coursework/Chapter\ 3\ -\ Operators/answers\ -\ chapter\ 3.odt \
	coursework/Chapter\ 3\ -\ Operators/exercises\ -\ chapter\ 3.odt \
	coursework/Chapter\ 4\ -\ Flow\ Control/Lab4/lab4.ec \
	coursework/Chapter\ 4\ -\ Flow\ Control/Lab4/Lab4.epj \
	coursework/Chapter\ 4\ -\ Flow\ Control/answers\ -\ chapter\ 4.odt \
	coursework/Chapter\ 4\ -\ Flow\ Control/exercises\ -\ chapter\ 4.odt \
	coursework/Chapter\ 5\ -\ Structures\ and\ Enumerations/Lab5/colors/lab5colors.ec
RESOURCES7 = \
	coursework/Chapter\ 5\ -\ Structures\ and\ Enumerations/Lab5/colors/lab5colors.epj \
	coursework/Chapter\ 5\ -\ Structures\ and\ Enumerations/Lab5/vectors/lab5vectors.ec \
	coursework/Chapter\ 5\ -\ Structures\ and\ Enumerations/Lab5/vectors/lab5vectors.epj \
	coursework/Chapter\ 5\ -\ Structures\ and\ Enumerations/answers\ -\ chapter\ 5.odt \
	coursework/Chapter\ 5\ -\ Structures\ and\ Enumerations/exercises\ -\ chapter\ 5.odt \
	coursework/Chapter\ 6\ -\ Classes,\ Methods\ and\ Instances/Lab6/lab6.ec \
	coursework/Chapter\ 6\ -\ Classes,\ Methods\ and\ Instances/Lab6/lab6.epj \
	coursework/Chapter\ 6\ -\ Classes,\ Methods\ and\ Instances/answers\ -\ chapter\ 6.odt \
	coursework/Chapter\ 6\ -\ Classes,\ Methods\ and\ Instances/exercises\ -\ chapter\ 6.odt \
	../obj/win32/bin/ecere.dll \
	../obj/win32/lib/libecereVanilla.a \
	../obj/win32/bin/EcereAudio.dll \
	upx391w/upx.exe \
	upx391w/BUGS \
	upx391w/COPYING \
	upx391w/LICENSE \
	upx391w/NEWS \
	upx391w/README \
	upx391w/README.1ST \
	upx391w/THANKS \
	upx391w/TODO \
	upx391w/upx.1 \
	upx391w/upx.doc \
	upx391w/upx.html \
	../samples/3D/Animate3DS/res/desktop.3ds \
	../samples/3D/Animate3DS/res/floor.jpg \
	../samples/3D/Animate3DS/res/wall_80.jpg \
	../samples/3D/Animate3DS/Animate3DS.ec \
	../samples/3D/Animate3DS/Animate3DS.epj \
	../samples/3D/ColorSpheres/colorSpheres.ec \
	../samples/3D/ColorSpheres/colorSpheres.epj \
	../samples/3D/cube2/cube2.ec \
	../samples/3D/cube2/cube2.epj
RESOURCES8 = \
	../samples/3D/cube2/knot.png \
	../samples/3D/cube2/fractal3.jpg \
	../samples/3D/glTriangle/glTriangle.ec \
	../samples/3D/glTriangle/glTriangle.epj \
	../samples/3D/hello3D/hello3D.ec \
	../samples/3D/hello3D/hello3D.epj \
	../samples/3D/HiraganaCube/FreeSans.ttf \
	../samples/3D/HiraganaCube/hiraganaCube.ec \
	../samples/3D/HiraganaCube/HiraganaCube.epj \
	../samples/3D/ModelViewer/res/ecere.png \
	../samples/3D/ModelViewer/res/help.txt \
	../samples/3D/ModelViewer/models/barn/barn.3DS \
	../samples/3D/ModelViewer/models/barn/Batten.jpg \
	../samples/3D/ModelViewer/models/barn/Boardbmp.jpg \
	../samples/3D/ModelViewer/models/barn/Boards.jpg \
	../samples/3D/ModelViewer/models/barn/Boards1.jpg \
	../samples/3D/ModelViewer/models/barn/Concrete.jpg \
	../samples/3D/ModelViewer/models/barn/cutout.jpg \
	../samples/3D/ModelViewer/models/barn/Finish.jpg \
	../samples/3D/ModelViewer/models/barn/FlWood.jpg \
	../samples/3D/ModelViewer/models/barn/Horizont.jpg \
	../samples/3D/ModelViewer/models/barn/OLDWOOD.jpg \
	../samples/3D/ModelViewer/models/barn/Read\ me_Old\ Barn.txt \
	../samples/3D/ModelViewer/models/barn/SANDSHOR.JPG \
	../samples/3D/ModelViewer/models/barn/Shadow.jpg \
	../samples/3D/ModelViewer/models/barn/STEELPLT.JPG \
	../samples/3D/ModelViewer/models/barn/Trellis.jpg \
	../samples/3D/ModelViewer/models/barn/Wood1.jpg \
	../samples/3D/ModelViewer/models/cart/Barrel.JPG \
	../samples/3D/ModelViewer/models/cart/cart.3DS \
	../samples/3D/ModelViewer/models/cart/Cart1.jpg
RESOURCES9 = \
	../samples/3D/ModelViewer/models/cart/Cart2.jpg \
	../samples/3D/ModelViewer/models/cart/Cart3.jpg \
	../samples/3D/ModelViewer/models/cart/metal_F.jpg \
	../samples/3D/ModelViewer/models/cart/MetCart1.jpg \
	../samples/3D/ModelViewer/models/cart/MetCart2.jpg \
	../samples/3D/ModelViewer/models/cart/OLDWOOD.JPG \
	../samples/3D/ModelViewer/models/cart/Read\ me_Cart\ For\ the\ Barn.txt \
	../samples/3D/ModelViewer/models/cart/WoodBr.jpg \
	../samples/3D/ModelViewer/models/cow/cow.3DS \
	../samples/3D/ModelViewer/models/cow/spot_tex.png \
	../samples/3D/ModelViewer/models/duck/duck.3DS \
	../samples/3D/ModelViewer/models/duck/duck.png \
	../samples/3D/ModelViewer/models/house/bordo.jpg \
	../samples/3D/ModelViewer/models/house/cement.jpg \
	../samples/3D/ModelViewer/models/house/CUT2WV.JPG \
	../samples/3D/ModelViewer/models/house/CUTWV.JPG \
	../samples/3D/ModelViewer/models/house/fence.JPG \
	../samples/3D/ModelViewer/models/house/Hardwood.jpg \
	../samples/3D/ModelViewer/models/house/house.3DS \
	../samples/3D/ModelViewer/models/house/latB.jpg \
	../samples/3D/ModelViewer/models/house/lati.jpg \
	../samples/3D/ModelViewer/models/house/latiA.jpg \
	../samples/3D/ModelViewer/models/house/OLDWOOD.JPG \
	../samples/3D/ModelViewer/models/house/pezzomur.jpg \
	../samples/3D/ModelViewer/models/house/Read\ me_House.txt \
	../samples/3D/ModelViewer/models/house/Tetto1.jpg \
	../samples/3D/ModelViewer/models/katanakake/Katanakake.3DS \
	../samples/3D/ModelViewer/models/katanakake/Wood_t~1.jpg
RESOURCES10 = \
	../samples/3D/ModelViewer/models/table/aluminiu.jpg \
	../samples/3D/ModelViewer/models/table/pine_4.JPG \
	../samples/3D/ModelViewer/models/table/Read\ me_Set\ LunchRoom.txt \
	../samples/3D/ModelViewer/models/table/table.3DS \
	../samples/3D/ModelViewer/models/teapot.3DS \
	../samples/3D/ModelViewer/skycube/bk.jpg \
	../samples/3D/ModelViewer/skycube/dn.jpg \
	../samples/3D/ModelViewer/skycube/fr.jpg \
	../samples/3D/ModelViewer/skycube/lf.jpg \
	../samples/3D/ModelViewer/skycube/rt.jpg \
	../samples/3D/ModelViewer/skycube/up.jpg \
	../samples/3D/ModelViewer/eModel.ec \
	../samples/3D/ModelViewer/eModel.epj \
	../samples/3D/ModelViewer/engineSettings.ec \
	../samples/3D/OpenGL/glEcereCamera.ec \
	../samples/3D/OpenGL/glSnippet.ec \
	../samples/3D/OpenGL/OpenGL.epj \
	../samples/3D/orbitWithMouse/res/icon1.png \
	../samples/3D/orbitWithMouse/res/icon10.png \
	../samples/3D/orbitWithMouse/res/icon2.png \
	../samples/3D/orbitWithMouse/res/icon3.png \
	../samples/3D/orbitWithMouse/res/icon4.png \
	../samples/3D/orbitWithMouse/res/icon5.png \
	../samples/3D/orbitWithMouse/res/icon6.png \
	../samples/3D/orbitWithMouse/res/icon7.png \
	../samples/3D/orbitWithMouse/res/icon8.png \
	../samples/3D/orbitWithMouse/res/icon9.png \
	../samples/3D/orbitWithMouse/res/img1.jpg \
	../samples/3D/orbitWithMouse/res/img2.jpg \
	../samples/3D/orbitWithMouse/res/img3.jpg \
	../samples/3D/orbitWithMouse/res/img4.jpg \
	../samples/3D/orbitWithMouse/res/img5.jpg
RESOURCES11 = \
	../samples/3D/orbitWithMouse/orbitWithMouse.ec \
	../samples/3D/orbitWithMouse/orbitWithMouse.epj \
	../samples/3D/rayTracedMandelbulb/mandelbulb.ec \
	../samples/3D/rayTracedMandelbulb/mandelbulb.epj \
	../samples/3D/spriteBalls/balls.ec \
	../samples/3D/spriteBalls/balls.epj \
	../samples/3D/terrainCameraDemo/res/aircraft/06\ 17\ 09.png \
	../samples/3D/terrainCameraDemo/res/aircraft/aircraft.3DS \
	../samples/3D/terrainCameraDemo/res/N45W110.hgt \
	../samples/3D/terrainCameraDemo/res/texture.png \
	../samples/3D/terrainCameraDemo/res/texture1.pcx \
	../samples/3D/terrainCameraDemo/cameraDemo.epj \
	../samples/3D/terrainCameraDemo/demo.ec \
	../samples/3D/terrainCameraDemo/dna.ec \
	../samples/3D/terrainCameraDemo/terrain.ec \
	../samples/3D/Test3D/Test3D.ec \
	../samples/3D/Test3D/Test3D.epj \
	../samples/3D/TransCube/glass.bmp \
	../samples/3D/TransCube/tex1.bmp \
	../samples/3D/TransCube/tex2.bmp \
	../samples/3D/TransCube/tex3.bmp \
	../samples/3D/TransCube/tex4.bmp \
	../samples/3D/TransCube/tex5.bmp \
	../samples/3D/TransCube/tex6.bmp \
	../samples/3D/TransCube/tex7.bmp \
	../samples/3D/TransCube/tex8.bmp \
	../samples/3D/TransCube/transCube.ec \
	../samples/3D/TransCube/transCube.epj \
	../samples/3D/VertexColorTest/VertexColorTest.ec \
	../samples/3D/VertexColorTest/VertexColorTest.epj \
	../samples/3D/walkAround/walkAround.ec \
	../samples/3D/walkAround/walkAround.epj \
	../samples/3D/materials/materials.ec \
	../samples/3D/materials/materials.epj
RESOURCES12 = \
	../samples/3D/materials/normal.jpg \
	../samples/3D/materials/teapot.3DS \
	../samples/audio/DirectBufferPlayer/wavPlayer.ec \
	../samples/audio/DirectBufferPlayer/WavPlayer.epj \
	../samples/audio/DirectBufferPlayer/sweep.wav \
	../samples/audio/Piano/Piano.ec \
	../samples/audio/Piano/Piano.epj \
	../samples/audio/Piano/cello.wav \
	../samples/audio/Piano/piano.wav \
	../samples/audio/Piano/tone.wav \
	../samples/audio/Piano/xylophone.wav \
	../samples/audio/PlaySound/PlaySound.ec \
	../samples/audio/PlaySound/PlaySound.epj \
	../samples/audio/PlaySound/sound.wav \
	../samples/audio/S3MPlayer/keven1.s3m \
	../samples/audio/SineTone/sineTone.ec \
	../samples/audio/SineTone/sineTone.epj \
	../samples/audio/Ecere\ Audio\ Library.odp \
	../samples/db/EDATest/EDATest.ec \
	../samples/db/EDATest/EDATest.epj \
	../samples/db/MedDB/mainForm.ec \
	../samples/db/MedDB/med.ec \
	../samples/db/MedDB/med.edb \
	../samples/db/MedDB/med.epj \
	../samples/db/MovieCollection/allMoviesReport.ec \
	../samples/db/MovieCollection/borrowerReport.ec \
	../samples/db/MovieCollection/movieCollection.ec \
	../samples/db/MovieCollection/MovieCollection.epj \
	../samples/db/MovieCollection/movieSchema.ec \
	../samples/db/MovieCollection/reports.ec \
	../samples/db/MovieCollection/collection.sqlite \
	../samples/db/eda\ presentation.odp \
	../samples/eC/ampheck/ampheck.epj \
	../samples/eC/ampheck/main.ec \
	../samples/eC/ecas/ecas.ec \
	../samples/eC/ecas/ecas.epj \
	../samples/eC/ecas/expression.ec \
	../samples/eC/ecas/misc.ec
RESOURCES13 = \
	../samples/eC/fibonacci/fibo.ec \
	../samples/eC/fibonacci/fibo.epj \
	../samples/eC/FindPrime/findPrime.ec \
	../samples/eC/FindPrime/PrimeTest.epj \
	../samples/eC/HelloWorld/HelloWorld.ec \
	../samples/eC/HelloWorld/HelloWorld.epj \
	../samples/eC/neural/neural.ec \
	../samples/eC/neural/neural.epj \
	../samples/eC/neural/neurons.ec \
	../samples/eC/staticLink/staticLink.ec \
	../samples/eC/staticLink/staticLink.epj \
	../samples/games/cornerBlocks/cornerBlocks.ec \
	../samples/games/cornerBlocks/cornerBlocks.epj \
	../samples/games/cornerBlocks/CornerBlocksServer.ec \
	../samples/games/bomb/res/3.pcx \
	../samples/games/bomb/res/block.pcx \
	../samples/games/bomb/res/bomb.pcx \
	../samples/games/bomb/res/deacbomb.pcx \
	../samples/games/bomb/res/deadeac.pcx \
	../samples/games/bomb/res/desactiv.pcx \
	../samples/games/bomb/res/map1.dat \
	../samples/games/bomb/res/map10.dat \
	../samples/games/bomb/res/map11.dat \
	../samples/games/bomb/res/map2.dat \
	../samples/games/bomb/res/map3.dat \
	../samples/games/bomb/res/map4.dat \
	../samples/games/bomb/res/map5.dat \
	../samples/games/bomb/res/map6.dat \
	../samples/games/bomb/res/map7.dat \
	../samples/games/bomb/res/map8.dat \
	../samples/games/bomb/res/map9.dat \
	../samples/games/bomb/res/max3.pcx \
	../samples/games/bomb/res/nothing.pcx \
	../samples/games/bomb/res/password.pcx \
	../samples/games/bomb/res/player.pcx \
	../samples/games/bomb/bomb.ec \
	../samples/games/bomb/bomb.epj \
	../samples/games/stonePairs/res/remove.png
RESOURCES14 = \
	../samples/games/stonePairs/res/arrow.png \
	../samples/games/stonePairs/res/black.png \
	../samples/games/stonePairs/res/blackGray.png \
	../samples/games/stonePairs/res/board.jpg \
	../samples/games/stonePairs/res/white.png \
	../samples/games/stonePairs/res/whiteGray.png \
	../samples/games/stonePairs/Building\ a\ simple\ board\ game\ with\ the\ Ecere\ SDK.odp \
	../samples/games/stonePairs/game.ec \
	../samples/games/stonePairs/stonePairs.ec \
	../samples/games/stonePairs/stonePairs.epj \
	../samples/games/cards/poker/bet.ec \
	../samples/games/cards/poker/player.ec \
	../samples/games/cards/poker/poker.ec \
	../samples/games/cards/poker/poker.epj \
	../samples/games/cards/poker/pokerutils.ec \
	../samples/games/cards/poker/widow.ec \
	../samples/games/cards/res/10c.png \
	../samples/games/cards/res/10d.png \
	../samples/games/cards/res/10h.png \
	../samples/games/cards/res/10s.png \
	../samples/games/cards/res/2c.png \
	../samples/games/cards/res/2d.png \
	../samples/games/cards/res/2h.png \
	../samples/games/cards/res/2s.png \
	../samples/games/cards/res/3c.png \
	../samples/games/cards/res/3d.png \
	../samples/games/cards/res/3h.png \
	../samples/games/cards/res/3s.png \
	../samples/games/cards/res/4c.png \
	../samples/games/cards/res/4d.png \
	../samples/games/cards/res/4h.png \
	../samples/games/cards/res/4s.png \
	../samples/games/cards/res/5c.png \
	../samples/games/cards/res/5d.png \
	../samples/games/cards/res/5h.png \
	../samples/games/cards/res/5s.png
RESOURCES15 = \
	../samples/games/cards/res/6c.png \
	../samples/games/cards/res/6d.png \
	../samples/games/cards/res/6h.png \
	../samples/games/cards/res/6s.png \
	../samples/games/cards/res/7c.png \
	../samples/games/cards/res/7d.png \
	../samples/games/cards/res/7h.png \
	../samples/games/cards/res/7s.png \
	../samples/games/cards/res/8c.png \
	../samples/games/cards/res/8d.png \
	../samples/games/cards/res/8h.png \
	../samples/games/cards/res/8s.png \
	../samples/games/cards/res/9c.png \
	../samples/games/cards/res/9d.png \
	../samples/games/cards/res/9h.png \
	../samples/games/cards/res/9s.png \
	../samples/games/cards/res/ac.png \
	../samples/games/cards/res/ad.png \
	../samples/games/cards/res/ah.png \
	../samples/games/cards/res/as.png \
	../samples/games/cards/res/back.png \
	../samples/games/cards/res/clubs.png \
	../samples/games/cards/res/diamonds.png \
	../samples/games/cards/res/hearts.png \
	../samples/games/cards/res/jc.png \
	../samples/games/cards/res/jd.png \
	../samples/games/cards/res/jh.png \
	../samples/games/cards/res/js.png \
	../samples/games/cards/res/kc.png \
	../samples/games/cards/res/kd.png \
	../samples/games/cards/res/kh.png \
	../samples/games/cards/res/ks.png \
	../samples/games/cards/res/qc.png \
	../samples/games/cards/res/qd.png \
	../samples/games/cards/res/qh.png \
	../samples/games/cards/res/qs.png \
	../samples/games/cards/res/rb.png \
	../samples/games/cards/res/rr.png \
	../samples/games/cards/res/spades.png \
	../samples/games/cards/ruff/src/ai.ec
RESOURCES16 = \
	../samples/games/cards/ruff/src/bet.ec \
	../samples/games/cards/ruff/src/communication.ec \
	../samples/games/cards/ruff/src/ruff.ec \
	../samples/games/cards/ruff/src/scores.ec \
	../samples/games/cards/ruff/src/server.ec \
	../samples/games/cards/ruff/src/setup.ec \
	../samples/games/cards/ruff/src/trump.ec \
	../samples/games/cards/ruff/ruff.epj \
	../samples/games/cards/tongIts/tongits.ec \
	../samples/games/cards/tongIts/tongIts.epj \
	../samples/games/othello/res/blue.bmp \
	../samples/games/othello/res/green.bmp \
	../samples/games/othello/res/othello.bmp \
	../samples/games/othello/othello.ec \
	../samples/games/othello/Othello.epj \
	../samples/games/crosswords/res/englishWords.txt \
	../samples/games/crosswords/res/frenchWords.txt \
	../samples/games/crosswords/crossWords.ec \
	../samples/games/crosswords/crossWords.epj \
	../samples/games/crosswords/CrossWordsServer.ec \
	../samples/games/tetrominoes/res/tetrominoes.png \
	../samples/games/tetrominoes/tetrominoes.ec \
	../samples/games/tetrominoes/tetrominoes.epj \
	../samples/games/ticTacToe/SDKIntro.pdf \
	../samples/games/ticTacToe/TicTacToe.ec \
	../samples/games/ticTacToe/TicTacToe.epj \
	../samples/games/chess/res/aboutPic.jpg \
	../samples/games/chess/res/blackBishop.png \
	../samples/games/chess/res/blackKing.png \
	../samples/games/chess/res/blackKnight.png \
	../samples/games/chess/res/blackPawn.png \
	../samples/games/chess/res/blackQueen.png \
	../samples/games/chess/res/blackRook.png \
	../samples/games/chess/res/board.jpg
RESOURCES17 = \
	../samples/games/chess/res/bthr.jpg \
	../samples/games/chess/res/chessSet.3ds \
	../samples/games/chess/res/darkwood.jpg \
	../samples/games/chess/res/lightwo1.jpg \
	../samples/games/chess/res/whiteBishop.png \
	../samples/games/chess/res/whiteKing.png \
	../samples/games/chess/res/whiteKnight.png \
	../samples/games/chess/res/whitePawn.png \
	../samples/games/chess/res/whiteQueen.png \
	../samples/games/chess/res/whiteRook.png \
	../samples/games/chess/src/about.ec \
	../samples/games/chess/src/ai.ec \
	../samples/games/chess/src/chess.ec \
	../samples/games/chess/src/chess2D.ec \
	../samples/games/chess/src/chess3D.ec \
	../samples/games/chess/src/chessutils.ec \
	../samples/games/chess/src/connect.ec \
	../samples/games/chess/src/promotion.ec \
	../samples/games/chess/chess.epj \
	../samples/guiAndGfx/bitmapsAndKB/Bitmap/bitmap.ec \
	../samples/guiAndGfx/bitmapsAndKB/Bitmap/bitmap.epj \
	../samples/guiAndGfx/bitmapsAndKB/KBController/controller.ec \
	../samples/guiAndGfx/bitmapsAndKB/KBController/controller.epj \
	../samples/guiAndGfx/bitmapsAndKB/KBOnKeyHit/OnKeyHit.ec \
	../samples/guiAndGfx/bitmapsAndKB/KBOnKeyHit/OnKeyHit.epj \
	../samples/guiAndGfx/bitmapsAndKB/KBState/KBState.ec \
	../samples/guiAndGfx/bitmapsAndKB/KBState/KBState.epj \
	../samples/guiAndGfx/bitmapsAndKB/Objects/objects.ec \
	../samples/guiAndGfx/bitmapsAndKB/Objects/objects.epj \
	../samples/guiAndGfx/bitmapsAndKB/res/archer.png \
	../samples/guiAndGfx/bitmapsAndKB/res/castle.png
RESOURCES18 = \
	../samples/guiAndGfx/bitmapsAndKB/res/dragon.png \
	../samples/guiAndGfx/bitmapsAndKB/res/knight.png \
	../samples/guiAndGfx/bitmapsAndKB/res/mage.png \
	../samples/guiAndGfx/bitmapsAndKB/res/mountain.png \
	../samples/guiAndGfx/bitmapsAndKB/res/mountains.png \
	../samples/guiAndGfx/bitmapsAndKB/res/tree.png \
	../samples/guiAndGfx/bitmapsAndKB/Bitmaps\ and\ Keyboard\ Input.odp \
	../samples/guiAndGfx/childWindows/res/stone2.jpg \
	../samples/guiAndGfx/childWindows/ex1.ec \
	../samples/guiAndGfx/childWindows/start.epj \
	../samples/guiAndGfx/clock/clock.ec \
	../samples/guiAndGfx/clock/clock.epj \
	../samples/guiAndGfx/Controls/controls.ec \
	../samples/guiAndGfx/Controls/controls.epj \
	../samples/guiAndGfx/curvyweb/curvyweb.ec \
	../samples/guiAndGfx/curvyweb/curvyweb.epj \
	../samples/guiAndGfx/dataBoxes/dataBoxes.ec \
	../samples/guiAndGfx/dataBoxes/dataBoxes.epj \
	../samples/guiAndGfx/DataControls/DataControls.ec \
	../samples/guiAndGfx/DataControls/DataControls.epj \
	../samples/guiAndGfx/disablingMovingControls/disabled_test.epj \
	../samples/guiAndGfx/disablingMovingControls/form2.ec \
	../samples/guiAndGfx/eNotepad/eNotepad.ec \
	../samples/guiAndGfx/eNotepad/eNotepad.epj \
	../samples/guiAndGfx/FlagsDropBox/flagsDropBox.ec \
	../samples/guiAndGfx/FlagsDropBox/FlagsDropBox.epj \
	../samples/guiAndGfx/fliPlay/fliPlay.epj \
	../samples/guiAndGfx/fliPlay/FliPlayApp.ec \
	../samples/guiAndGfx/floodFill/ePaint.epj \
	../samples/guiAndGfx/floodFill/floodFill.ec
RESOURCES19 = \
	../samples/guiAndGfx/HelloForm/helloForm.ec \
	../samples/guiAndGfx/HelloForm/helloForm.epj \
	../samples/guiAndGfx/LinkLabel/linkLabel.ec \
	../samples/guiAndGfx/LinkLabel/LinkLabel.epj \
	../samples/guiAndGfx/mdiSample/mdiSample.ec \
	../samples/guiAndGfx/mdiSample/mdiSample.epj \
	../samples/guiAndGfx/openrider/res/wheel.png \
	../samples/guiAndGfx/openrider/samples/glitch.ort \
	../samples/guiAndGfx/openrider/samples/sample.ort \
	../samples/guiAndGfx/openrider/form1.ec \
	../samples/guiAndGfx/openrider/game.ec \
	../samples/guiAndGfx/openrider/math.ec \
	../samples/guiAndGfx/openrider/openrider.epj \
	../samples/guiAndGfx/reminder/Reminder.ec \
	../samples/guiAndGfx/reminder/Reminder.epj \
	../samples/guiAndGfx/reminder/timeAddendum.ec \
	../samples/guiAndGfx/replace/replace.ec \
	../samples/guiAndGfx/replace/replace.epj \
	../samples/guiAndGfx/screenShot/shot.ec \
	../samples/guiAndGfx/screenShot/Shot.epj \
	../samples/guiAndGfx/skinning/res/bottomBorder.png \
	../samples/guiAndGfx/skinning/res/bottomLeftBorder.png \
	../samples/guiAndGfx/skinning/res/bottomRightBorder.png \
	../samples/guiAndGfx/skinning/res/downLeft.png \
	../samples/guiAndGfx/skinning/res/downMiddle.png \
	../samples/guiAndGfx/skinning/res/downRight.png \
	../samples/guiAndGfx/skinning/res/leftBorder.png \
	../samples/guiAndGfx/skinning/res/rightBorder.png \
	../samples/guiAndGfx/skinning/res/thumbDown.png \
	../samples/guiAndGfx/skinning/res/thumbUp.png \
	../samples/guiAndGfx/skinning/res/thumbVert.png
RESOURCES20 = \
	../samples/guiAndGfx/skinning/res/topBorder.png \
	../samples/guiAndGfx/skinning/res/topLeftBorder.png \
	../samples/guiAndGfx/skinning/res/topRightBorder.png \
	../samples/guiAndGfx/skinning/res/upLeft.png \
	../samples/guiAndGfx/skinning/res/upMiddle.png \
	../samples/guiAndGfx/skinning/res/upRight.png \
	../samples/guiAndGfx/skinning/AcovelSkin.ec \
	../samples/guiAndGfx/skinning/form1.ec \
	../samples/guiAndGfx/skinning/MySkin.ec \
	../samples/guiAndGfx/skinning/SimSkin.ec \
	../samples/guiAndGfx/skinning/SkinProject.epj \
	../samples/guiAndGfx/slideShow/eShow.ec \
	../samples/guiAndGfx/slideShow/eShow.epj \
	../samples/guiAndGfx/snow/snow.ec \
	../samples/guiAndGfx/snow/snow.epj \
	../samples/guiAndGfx/stacker/stackerTest.ec \
	../samples/guiAndGfx/stacker/stackerTest.epj \
	../samples/guiAndGfx/tabControl/tabs.ec \
	../samples/guiAndGfx/tabControl/tabs.epj \
	../samples/guiAndGfx/textScroller/Scroll.epj \
	../samples/guiAndGfx/textScroller/textScroller.ec \
	../samples/guiAndGfx/toolBars/toolBarDemo.ec \
	../samples/guiAndGfx/toolBars/toolBars.epj \
	../samples/guiAndGfx/toolTips/toolTips.ec \
	../samples/guiAndGfx/toolTips/Tooltips.epj \
	../samples/guiAndGfx/treeView/explorer.ec \
	../samples/guiAndGfx/treeView/treeView.epj \
	../samples/guiAndGfx/pictureRotateAlpha/image.png \
	../samples/guiAndGfx/pictureRotateAlpha/pictureRotate.epj \
	../samples/guiAndGfx/pictureRotateAlpha/rotate1.ec \
	../samples/guiAndGfx/fractals/samples/colorful.frc
RESOURCES21 = \
	../samples/guiAndGfx/fractals/samples/coolSpiral.frc \
	../samples/guiAndGfx/fractals/samples/deep.frc \
	../samples/guiAndGfx/fractals/samples/hot.frc \
	../samples/guiAndGfx/fractals/samples/hot2.frc \
	../samples/guiAndGfx/fractals/samples/minibrot.frc \
	../samples/guiAndGfx/fractals/samples/MOI.frc \
	../samples/guiAndGfx/fractals/samples/nicejulia.frc \
	../samples/guiAndGfx/fractals/samples/oldColors.frc \
	../samples/guiAndGfx/fractals/samples/purplishmandelbrot.frc \
	../samples/guiAndGfx/fractals/samples/seaHorseValley.frc \
	../samples/guiAndGfx/fractals/samples/star.frc \
	../samples/guiAndGfx/fractals/samples/sunnySpiral.frc \
	../samples/guiAndGfx/fractals/samples/woah.frc \
	../samples/guiAndGfx/fractals/fractals.ec \
	../samples/guiAndGfx/fractals/fractals.epj \
	../samples/guiAndGfx/fractals/GradientDesigner.ec \
	../samples/guiAndGfx/mandelbrot/mandelbrot.ec \
	../samples/guiAndGfx/mandelbrot/mandelbrot.epj \
	../samples/guiAndGfx/mandelbrot/mandelbrotUI.ec \
	../samples/guiAndGfx/mekano/mekano.ec \
	../samples/guiAndGfx/mekano/mekano.epj \
	../samples/guiAndGfx/mekano/mekanodisplay.ec \
	../samples/guiAndGfx/mekano/mekanoobject.ec \
	../samples/guiAndGfx/mekano/mekanoobjectfixed.ec \
	../samples/guiAndGfx/mekano/mekanoobjectgravity.ec \
	../samples/guiAndGfx/mekano/mekanoobjectpolygonal.ec \
	../samples/guiAndGfx/mekano/mekanoobjectspring.ec \
	../samples/guiAndGfx/mekano/mekanopoint.ec \
	../samples/guiAndGfx/mekano/mekanopolygon.ec
RESOURCES22 = \
	../samples/guiAndGfx/mekano/mekanopolygonalbox.ec \
	../samples/guiAndGfx/mekano/mekanosimulation.ec \
	../samples/guiAndGfx/mekano/mekanownd.ec \
	../samples/guiAndGfx/mekano/vector.ec \
	../samples/misc/licensing/licensing.ec \
	../samples/misc/licensing/licensing.epj \
	../samples/misc/licensing/myapp.LICENSE \
	../samples/net/DCOMSample/main.ec \
	../samples/net/DCOMSample/Server.ec \
	../samples/net/DCOMSample/Server.epj \
	../samples/net/eCom/connection.ec \
	../samples/net/eCom/eCom.epj \
	../samples/net/eCom/mainPanel.ec \
	../samples/net/eirc/console.ec \
	../samples/net/eirc/eIRC.ec \
	../samples/net/eirc/eIRC.epj \
	../samples/net/httpserver/http.ec \
	../samples/net/httpserver/httpServer.epj \
	../samples/net/networkFile/NetworkClient/client.ec \
	../samples/net/networkFile/NetworkClient/NetworkClient.epj \
	../samples/net/networkFile/NetworkServer/NetworkServer.epj \
	../samples/net/networkFile/NetworkServer/server.ec \
	../samples/net/smtp/smtp.ec \
	../samples/net/smtp/smtp.epj \
	../samples/net/SocketSample/socketSample.ec \
	../samples/net/SocketSample/SocketSample.epj \
	../samples/net/UDPSample/udptest.ec \
	../samples/net/UDPSample/UDPTest.epj \
	../samples/net/XMLSample/xmlSample.ec \
	../samples/net/XMLSample/XMLSample.epj \
	../samples/net/browser/browser.ec \
	../samples/net/browser/browser.epj \
	../samples/net/browser/newb.ico \
	../samples/net/browser/newb.png \
	../samples/net/browser/resources.rc \
	../samples/net/SocketRx/socketRx.ec
RESOURCES23 = \
	../samples/net/SocketRx/socketRx.epj \
	../samples/net/SocketTx/socketTX.ec \
	../samples/net/SocketTx/socketTX.epj \
	../samples/scanning/wiaTest/wiaTest.ec \
	../samples/scanning/wiaTest/wiaTest.epj \
	../samples/threads/threadsAndListBoxes/blank.ec \
	../samples/threads/threadsAndListBoxes/blank.epj \
	../samples/android/android/res/values/strings.xml \
	../samples/android/android/AndroidManifest.xml \
	../samples/android/res/ecere\ sdk.png \
	../samples/android/helloAndroid.ec \
	../samples/android/helloAndroid.epj \
	../samples/android/note.txt \
	../samples/LICENSE \
	../extras/gui/controls/CheckListBox.ec \
	../extras/gui/controls/LogBox.ec \
	../extras/gui/controls/PasswordBox.ec \
	../extras/gui/controls/SearchBox.ec \
	../extras/gui/controls/StringsBox.ec \
	../extras/gui/skins/SimSkin.ec \
	../extras/gui/IconBag.ec \
	../extras/gui/layout.ec \
	../extras/gui/LicensesDialog.ec \
	../extras/gui/RoundedSquare.ec \
	../extras/gui/genericEditor.ec \
	../extras/html/htmlParser.ec \
	../extras/html/HTMLView.ec \
	../extras/html/lines.ec \
	../extras/html/tables.ec \
	../extras/res/licenses/crystalicons.LICENSE \
	../extras/res/licenses/ecere.LICENSE \
	../extras/res/licenses/ffi.LICENSE \
	../extras/res/licenses/freetype.LICENSE \
	../extras/res/licenses/gpl2.LICENSE \
	../extras/res/licenses/gpl3.LICENSE \
	../extras/res/licenses/harfbuzz.LICENSE \
	../extras/res/licenses/jpg.LICENSE \
	../extras/res/licenses/lgpl2.LICENSE \
	../extras/res/licenses/lgpl3.LICENSE
RESOURCES24 = \
	../extras/res/licenses/MinGW-w64.LICENSE \
	../extras/res/licenses/openSSL.LICENSE \
	../extras/res/licenses/png.LICENSE \
	../extras/res/licenses/sqlcipher.LICENSE \
	../extras/res/licenses/sqlite.LICENSE \
	../extras/res/licenses/tango.COPYING \
	../extras/res/licenses/tdm-gcc.LICENSE \
	../extras/res/licenses/ungif.LICENSE \
	../extras/res/licenses/upx.LICENSE \
	../extras/res/licenses/zlib.README \
	../extras/res/types/countryCode/ad.png \
	../extras/res/types/countryCode/ae.png \
	../extras/res/types/countryCode/af.png \
	../extras/res/types/countryCode/ag.png \
	../extras/res/types/countryCode/ai.png \
	../extras/res/types/countryCode/al.png \
	../extras/res/types/countryCode/am.png \
	../extras/res/types/countryCode/an.png \
	../extras/res/types/countryCode/ao.png \
	../extras/res/types/countryCode/ar.png \
	../extras/res/types/countryCode/as.png \
	../extras/res/types/countryCode/at.png \
	../extras/res/types/countryCode/au.png \
	../extras/res/types/countryCode/aw.png \
	../extras/res/types/countryCode/ax.png \
	../extras/res/types/countryCode/az.png \
	../extras/res/types/countryCode/ba.png \
	../extras/res/types/countryCode/bb.png \
	../extras/res/types/countryCode/bd.png \
	../extras/res/types/countryCode/be.png \
	../extras/res/types/countryCode/bf.png \
	../extras/res/types/countryCode/bg.png \
	../extras/res/types/countryCode/bh.png \
	../extras/res/types/countryCode/bi.png \
	../extras/res/types/countryCode/bj.png \
	../extras/res/types/countryCode/bm.png
RESOURCES25 = \
	../extras/res/types/countryCode/bn.png \
	../extras/res/types/countryCode/bo.png \
	../extras/res/types/countryCode/br.png \
	../extras/res/types/countryCode/bs.png \
	../extras/res/types/countryCode/bt.png \
	../extras/res/types/countryCode/bv.png \
	../extras/res/types/countryCode/bw.png \
	../extras/res/types/countryCode/by.png \
	../extras/res/types/countryCode/bz.png \
	../extras/res/types/countryCode/ca.png \
	../extras/res/types/countryCode/catalonia.png \
	../extras/res/types/countryCode/cc.png \
	../extras/res/types/countryCode/cd.png \
	../extras/res/types/countryCode/cf.png \
	../extras/res/types/countryCode/cg.png \
	../extras/res/types/countryCode/ch.png \
	../extras/res/types/countryCode/ci.png \
	../extras/res/types/countryCode/ck.png \
	../extras/res/types/countryCode/cl.png \
	../extras/res/types/countryCode/cm.png \
	../extras/res/types/countryCode/cn.png \
	../extras/res/types/countryCode/co.png \
	../extras/res/types/countryCode/cr.png \
	../extras/res/types/countryCode/cs.png \
	../extras/res/types/countryCode/cu.png \
	../extras/res/types/countryCode/cv.png \
	../extras/res/types/countryCode/cx.png \
	../extras/res/types/countryCode/cy.png \
	../extras/res/types/countryCode/cz.png \
	../extras/res/types/countryCode/de.png \
	../extras/res/types/countryCode/dj.png \
	../extras/res/types/countryCode/dk.png \
	../extras/res/types/countryCode/dm.png \
	../extras/res/types/countryCode/do.png \
	../extras/res/types/countryCode/dz.png \
	../extras/res/types/countryCode/ec.png
RESOURCES26 = \
	../extras/res/types/countryCode/ee.png \
	../extras/res/types/countryCode/eg.png \
	../extras/res/types/countryCode/eh.png \
	../extras/res/types/countryCode/england.png \
	../extras/res/types/countryCode/er.png \
	../extras/res/types/countryCode/es.png \
	../extras/res/types/countryCode/et.png \
	../extras/res/types/countryCode/europeanunion.png \
	../extras/res/types/countryCode/fam.png \
	../extras/res/types/countryCode/fi.png \
	../extras/res/types/countryCode/fj.png \
	../extras/res/types/countryCode/fk.png \
	../extras/res/types/countryCode/fm.png \
	../extras/res/types/countryCode/fo.png \
	../extras/res/types/countryCode/fr.png \
	../extras/res/types/countryCode/ga.png \
	../extras/res/types/countryCode/gb.png \
	../extras/res/types/countryCode/gd.png \
	../extras/res/types/countryCode/ge.png \
	../extras/res/types/countryCode/gf.png \
	../extras/res/types/countryCode/gh.png \
	../extras/res/types/countryCode/gi.png \
	../extras/res/types/countryCode/gl.png \
	../extras/res/types/countryCode/gm.png \
	../extras/res/types/countryCode/gn.png \
	../extras/res/types/countryCode/gp.png \
	../extras/res/types/countryCode/gq.png \
	../extras/res/types/countryCode/gr.png \
	../extras/res/types/countryCode/gs.png \
	../extras/res/types/countryCode/gt.png \
	../extras/res/types/countryCode/gu.png \
	../extras/res/types/countryCode/gw.png \
	../extras/res/types/countryCode/gy.png \
	../extras/res/types/countryCode/hk.png \
	../extras/res/types/countryCode/hm.png \
	../extras/res/types/countryCode/hn.png
RESOURCES27 = \
	../extras/res/types/countryCode/hr.png \
	../extras/res/types/countryCode/ht.png \
	../extras/res/types/countryCode/hu.png \
	../extras/res/types/countryCode/id.png \
	../extras/res/types/countryCode/ie.png \
	../extras/res/types/countryCode/il.png \
	../extras/res/types/countryCode/in.png \
	../extras/res/types/countryCode/io.png \
	../extras/res/types/countryCode/iq.png \
	../extras/res/types/countryCode/ir.png \
	../extras/res/types/countryCode/is.png \
	../extras/res/types/countryCode/it.png \
	../extras/res/types/countryCode/jm.png \
	../extras/res/types/countryCode/jo.png \
	../extras/res/types/countryCode/jp.png \
	../extras/res/types/countryCode/ke.png \
	../extras/res/types/countryCode/kg.png \
	../extras/res/types/countryCode/kh.png \
	../extras/res/types/countryCode/ki.png \
	../extras/res/types/countryCode/km.png \
	../extras/res/types/countryCode/kn.png \
	../extras/res/types/countryCode/kp.png \
	../extras/res/types/countryCode/kr.png \
	../extras/res/types/countryCode/kw.png \
	../extras/res/types/countryCode/ky.png \
	../extras/res/types/countryCode/kz.png \
	../extras/res/types/countryCode/la.png \
	../extras/res/types/countryCode/lb.png \
	../extras/res/types/countryCode/lc.png \
	../extras/res/types/countryCode/li.png \
	../extras/res/types/countryCode/lk.png \
	../extras/res/types/countryCode/lr.png \
	../extras/res/types/countryCode/ls.png \
	../extras/res/types/countryCode/lt.png \
	../extras/res/types/countryCode/lu.png \
	../extras/res/types/countryCode/lv.png
RESOURCES28 = \
	../extras/res/types/countryCode/ly.png \
	../extras/res/types/countryCode/ma.png \
	../extras/res/types/countryCode/mc.png \
	../extras/res/types/countryCode/md.png \
	../extras/res/types/countryCode/me.png \
	../extras/res/types/countryCode/mg.png \
	../extras/res/types/countryCode/mh.png \
	../extras/res/types/countryCode/mk.png \
	../extras/res/types/countryCode/ml.png \
	../extras/res/types/countryCode/mm.png \
	../extras/res/types/countryCode/mn.png \
	../extras/res/types/countryCode/mo.png \
	../extras/res/types/countryCode/mp.png \
	../extras/res/types/countryCode/mq.png \
	../extras/res/types/countryCode/mr.png \
	../extras/res/types/countryCode/ms.png \
	../extras/res/types/countryCode/mt.png \
	../extras/res/types/countryCode/mu.png \
	../extras/res/types/countryCode/mv.png \
	../extras/res/types/countryCode/mw.png \
	../extras/res/types/countryCode/mx.png \
	../extras/res/types/countryCode/my.png \
	../extras/res/types/countryCode/mz.png \
	../extras/res/types/countryCode/na.png \
	../extras/res/types/countryCode/nc.png \
	../extras/res/types/countryCode/ne.png \
	../extras/res/types/countryCode/nf.png \
	../extras/res/types/countryCode/ng.png \
	../extras/res/types/countryCode/ni.png \
	../extras/res/types/countryCode/nl.png \
	../extras/res/types/countryCode/no.png \
	../extras/res/types/countryCode/np.png \
	../extras/res/types/countryCode/nr.png \
	../extras/res/types/countryCode/nu.png \
	../extras/res/types/countryCode/nz.png \
	../extras/res/types/countryCode/om.png
RESOURCES29 = \
	../extras/res/types/countryCode/pa.png \
	../extras/res/types/countryCode/pe.png \
	../extras/res/types/countryCode/pf.png \
	../extras/res/types/countryCode/pg.png \
	../extras/res/types/countryCode/ph.png \
	../extras/res/types/countryCode/pk.png \
	../extras/res/types/countryCode/pl.png \
	../extras/res/types/countryCode/pm.png \
	../extras/res/types/countryCode/pn.png \
	../extras/res/types/countryCode/pr.png \
	../extras/res/types/countryCode/ps.png \
	../extras/res/types/countryCode/pt.png \
	../extras/res/types/countryCode/pw.png \
	../extras/res/types/countryCode/py.png \
	../extras/res/types/countryCode/qa.png \
	../extras/res/types/countryCode/re.png \
	../extras/res/types/countryCode/ro.png \
	../extras/res/types/countryCode/rs.png \
	../extras/res/types/countryCode/ru.png \
	../extras/res/types/countryCode/rw.png \
	../extras/res/types/countryCode/sa.png \
	../extras/res/types/countryCode/sb.png \
	../extras/res/types/countryCode/sc.png \
	../extras/res/types/countryCode/scotland.png \
	../extras/res/types/countryCode/sd.png \
	../extras/res/types/countryCode/se.png \
	../extras/res/types/countryCode/sg.png \
	../extras/res/types/countryCode/sh.png \
	../extras/res/types/countryCode/si.png \
	../extras/res/types/countryCode/sj.png \
	../extras/res/types/countryCode/sk.png \
	../extras/res/types/countryCode/sl.png \
	../extras/res/types/countryCode/sm.png \
	../extras/res/types/countryCode/sn.png \
	../extras/res/types/countryCode/so.png \
	../extras/res/types/countryCode/sr.png
RESOURCES30 = \
	../extras/res/types/countryCode/st.png \
	../extras/res/types/countryCode/sv.png \
	../extras/res/types/countryCode/sy.png \
	../extras/res/types/countryCode/sz.png \
	../extras/res/types/countryCode/tc.png \
	../extras/res/types/countryCode/td.png \
	../extras/res/types/countryCode/tf.png \
	../extras/res/types/countryCode/tg.png \
	../extras/res/types/countryCode/th.png \
	../extras/res/types/countryCode/tj.png \
	../extras/res/types/countryCode/tk.png \
	../extras/res/types/countryCode/tl.png \
	../extras/res/types/countryCode/tm.png \
	../extras/res/types/countryCode/tn.png \
	../extras/res/types/countryCode/to.png \
	../extras/res/types/countryCode/tr.png \
	../extras/res/types/countryCode/tt.png \
	../extras/res/types/countryCode/tv.png \
	../extras/res/types/countryCode/tw.png \
	../extras/res/types/countryCode/tz.png \
	../extras/res/types/countryCode/ua.png \
	../extras/res/types/countryCode/ug.png \
	../extras/res/types/countryCode/um.png \
	../extras/res/types/countryCode/us.png \
	../extras/res/types/countryCode/uy.png \
	../extras/res/types/countryCode/uz.png \
	../extras/res/types/countryCode/va.png \
	../extras/res/types/countryCode/vc.png \
	../extras/res/types/countryCode/ve.png \
	../extras/res/types/countryCode/vg.png \
	../extras/res/types/countryCode/vi.png \
	../extras/res/types/countryCode/vn.png \
	../extras/res/types/countryCode/vu.png \
	../extras/res/types/countryCode/wales.png \
	../extras/res/types/countryCode/wf.png \
	../extras/res/types/countryCode/ws.png
RESOURCES31 = \
	../extras/res/types/countryCode/ye.png \
	../extras/res/types/countryCode/yt.png \
	../extras/res/types/countryCode/za.png \
	../extras/res/types/countryCode/zm.png \
	../extras/res/types/countryCode/zw.png \
	../extras/tiles/astar.ec \
	../extras/tiles/sequence.ec \
	../extras/tiles/sprite.ec \
	../extras/tiles/tiles.ec \
	../extras/types/CountryCode.ec \
	../extras/types/Currency.ec \
	../extras/types/ShortDate.ec \
	../extras/types/DynamicString.ec \
	../extras/base64.ec \
	../extras/CSVDataParser.ec \
	../extras/CSVParser.ec \
	../extras/EnvironmentVariables.ec \
	../extras/FileSystemIterator.ec \
	../extras/fli.ec \
	../extras/fliPlay.ec \
	../extras/md5.ec \
	../extras/Regex.ec \
	../extras/sha256.ec \
	../extras/SMTPSocket.ec \
	../extras/timeTools.ec \
	../extras/wia.ec \
	../extras/windowsShortcut.ec \
	../extras/XMLParser.ec \
	../extras/createLink.ec \
	../extras/stringTools.ec \
	../extras/res/licenses/freetype.LICENSE \
	../extras/res/licenses/harfbuzz.LICENSE \
	../extras/res/licenses/jpg.LICENSE \
	../extras/res/licenses/png.LICENSE \
	../extras/res/licenses/sqlite.LICENSE \
	../extras/res/licenses/tango.COPYING \
	../extras/res/licenses/ungif.LICENSE \
	../extras/res/licenses/upx.LICENSE \
	../extras/res/licenses/zlib.README \
	../LICENSE \
	../extras/res/licenses/MinGW-w64.LICENSE \
	../extras/res/licenses/tdm-gcc.LICENSE \
	../extras/res/licenses/ffi.LICENSE \
	../obj/win32.x32/bin/documentor.exe \
	../obj/win32.x32/bin/ecere-ide.exe \
	../obj/win32.x32/bin/ear.exe \
	../obj/win32.x32/bin/ec.dll
RESOURCES32 = \
	../obj/win32.x32/bin/ecc.exe \
	../obj/win32.x32/bin/ecereCOM.dll \
	../obj/win32.x32/bin/ecp.exe \
	../obj/win32.x32/bin/ecs.exe \
	../obj/win32.x32/bin/epj2make.exe \
	../obj/win32.x32/bin/EDA.dll \
	../obj/win32.x32/bin/EDASQLite.dll \
	../obj/win32.x32/bin/ecere.dll \
	../obj/win32.x32/lib/libecereVanilla.a \
	../obj/win32.x32/bin/EcereAudio.dll \
	tdm/gdb/gdb.exe \
	tdm/gdb/i686-w64-mingw32-gdb.exe \
	tdm/binutils-2.25-tdm64-1/COPYING.winpthreads.txt \
	tdm/binutils-2.25-tdm64-1/COPYING3-gcc-tdm.txt \
	tdm/binutils-2.25-tdm64-1/COPYING3.LIB-gcc-tdm.txt \
	tdm/binutils-2.25-tdm64-1/bin/addr2line.exe \
	tdm/binutils-2.25-tdm64-1/bin/ar.exe \
	tdm/binutils-2.25-tdm64-1/bin/as.exe \
	tdm/binutils-2.25-tdm64-1/bin/c++filt.exe \
	tdm/binutils-2.25-tdm64-1/bin/dlltool.exe \
	tdm/binutils-2.25-tdm64-1/bin/dllwrap.exe \
	tdm/binutils-2.25-tdm64-1/bin/elfedit.exe \
	tdm/binutils-2.25-tdm64-1/bin/gprof.exe \
	tdm/binutils-2.25-tdm64-1/bin/ld.bfd.exe \
	tdm/binutils-2.25-tdm64-1/bin/ld.exe \
	tdm/binutils-2.25-tdm64-1/bin/nm.exe \
	tdm/binutils-2.25-tdm64-1/bin/objcopy.exe \
	tdm/binutils-2.25-tdm64-1/bin/objdump.exe \
	tdm/binutils-2.25-tdm64-1/bin/ranlib.exe \
	tdm/binutils-2.25-tdm64-1/bin/readelf.exe \
	tdm/binutils-2.25-tdm64-1/bin/size.exe \
	tdm/binutils-2.25-tdm64-1/bin/strings.exe \
	tdm/binutils-2.25-tdm64-1/bin/strip.exe \
	tdm/binutils-2.25-tdm64-1/bin/windmc.exe \
	tdm/binutils-2.25-tdm64-1/bin/windres.exe \
	tdm/binutils-2.25-tdm64-1/include/ansidecl.h \
	tdm/binutils-2.25-tdm64-1/include/bfd.h
RESOURCES33 = \
	tdm/binutils-2.25-tdm64-1/include/bfdlink.h \
	tdm/binutils-2.25-tdm64-1/include/dis-asm.h \
	tdm/binutils-2.25-tdm64-1/include/plugin-api.h \
	tdm/binutils-2.25-tdm64-1/include/symcat.h \
	tdm/binutils-2.25-tdm64-1/lib/libbfd.a \
	tdm/binutils-2.25-tdm64-1/lib/libopcodes.a \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/ar.exe \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/as.exe \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/dlltool.exe \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/ld.bfd.exe \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/ld.exe \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/nm.exe \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/objcopy.exe \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/objdump.exe \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/ranlib.exe \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/strip.exe \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pe.x \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pe.xa \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pe.xbn \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pe.xn \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pe.xr \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pe.xu \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pep.x \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pep.xa
RESOURCES34 = \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pep.xbn \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pep.xn \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pep.xr \
	tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pep.xu \
	tdm/gcc-5.1.0-tdm64-1-core/bin/cpp.exe \
	tdm/gcc-5.1.0-tdm64-1-core/bin/gcc-ar.exe \
	tdm/gcc-5.1.0-tdm64-1-core/bin/gcc-nm.exe \
	tdm/gcc-5.1.0-tdm64-1-core/bin/gcc-ranlib.exe \
	tdm/gcc-5.1.0-tdm64-1-core/bin/gcc.exe \
	tdm/gcc-5.1.0-tdm64-1-core/bin/gcov-tool.exe \
	tdm/gcc-5.1.0-tdm64-1-core/bin/gcov.exe \
	tdm/gcc-5.1.0-tdm64-1-core/bin/libatomic-1.dll \
	tdm/gcc-5.1.0-tdm64-1-core/bin/libatomic_64-1.dll \
	tdm/gcc-5.1.0-tdm64-1-core/bin/libgcc_s_seh_64-1.dll \
	tdm/gcc-5.1.0-tdm64-1-core/bin/libgcc_s_sjlj-1.dll \
	tdm/gcc-5.1.0-tdm64-1-core/bin/libiconv-2.dll \
	tdm/gcc-5.1.0-tdm64-1-core/bin/libquadmath-0.dll \
	tdm/gcc-5.1.0-tdm64-1-core/bin/libquadmath_64-0.dll \
	tdm/gcc-5.1.0-tdm64-1-core/bin/libssp-0.dll \
	tdm/gcc-5.1.0-tdm64-1-core/bin/libssp_64-0.dll \
	tdm/gcc-5.1.0-tdm64-1-core/bin/libvtv-0.dll \
	tdm/gcc-5.1.0-tdm64-1-core/bin/libvtv_64-0.dll \
	tdm/gcc-5.1.0-tdm64-1-core/bin/libvtv_stubs-0.dll \
	tdm/gcc-5.1.0-tdm64-1-core/bin/libvtv_stubs_64-0.dll \
	tdm/gcc-5.1.0-tdm64-1-core/bin/libwinpthread-1.dll \
	tdm/gcc-5.1.0-tdm64-1-core/bin/libwinpthread_64-1.dll \
	tdm/gcc-5.1.0-tdm64-1-core/bin/x86_64-w64-mingw32-gcc-5.1.0.exe
RESOURCES35 = \
	tdm/gcc-5.1.0-tdm64-1-core/bin/x86_64-w64-mingw32-gcc-ar.exe \
	tdm/gcc-5.1.0-tdm64-1-core/bin/x86_64-w64-mingw32-gcc-nm.exe \
	tdm/gcc-5.1.0-tdm64-1-core/bin/x86_64-w64-mingw32-gcc-ranlib.exe \
	tdm/gcc-5.1.0-tdm64-1-core/bin/x86_64-w64-mingw32-gcc.exe \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/finclude/ieee_arithmetic.mod \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/finclude/ieee_exceptions.mod \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/finclude/ieee_features.mod \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/crtbegin.o \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/crtend.o \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/crtfastmath.o \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libatomic.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libatomic.dll.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libcaf_single.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libgcc.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libgcc_s.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libgcov.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libquadmath.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libquadmath.dll.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libssp.a
RESOURCES36 = \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libssp.dll.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libssp_nonshared.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libvtv.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libvtv.dll.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libvtv_stubs.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libvtv_stubs.dll.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/ssp/ssp.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/ssp/stdio.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/ssp/string.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/ssp/unistd.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/adxintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/ammintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx2intrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512bwintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512cdintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512dqintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512erintrin.h
RESOURCES37 = \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512fintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512ifmaintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512ifmavlintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512pfintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512vbmiintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512vbmivlintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512vlbwintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512vldqintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512vlintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avxintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/bmi2intrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/bmiintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/bmmintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/clflushoptintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/clwbintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/cpuid.h
RESOURCES38 = \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/cross-stdarg.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/emmintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/f16cintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/float.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/fma4intrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/fmaintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/fxsrintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/ia32intrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/immintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/iso646.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/lwpintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/lzcntintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/mm3dnow.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/mmintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/mm_malloc.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/nmmintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/omp.h
RESOURCES39 = \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/openacc.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/pcommitintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/pmmintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/popcntintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/prfchwintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/quadmath.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/quadmath_weak.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/rdseedintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/rtmintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/shaintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/smmintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stdalign.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stdarg.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stdatomic.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stdbool.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stddef.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stdfix.h
RESOURCES40 = \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stdint-gcc.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stdint.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stdnoreturn.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/tbmintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/tgmath.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/tmmintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/unwind.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/varargs.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/wmmintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/x86intrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/xmmintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/xopintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/xsavecintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/xsaveintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/xsaveoptintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/xsavesintrin.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/xtestintrin.h
RESOURCES41 = \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include-fixed/limits.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include-fixed/README \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include-fixed/syslimits.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/install-tools/include/limits.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/install-tools/include/README \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/install-tools/fixinc_list \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/install-tools/gsyslimits.h \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/install-tools/macro_list \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/install-tools/mkheaders.conf \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/crtbegin.o \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/crtend.o \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/crtfastmath.o \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libatomic.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libatomic.dll.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libgcc.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libgcc_s.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libgcov.a
RESOURCES42 = \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libquadmath.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libquadmath.dll.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libssp.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libssp.dll.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libssp_nonshared.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libvtv.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libvtv.dll.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libvtv_stubs.a \
	tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libvtv_stubs.dll.a \
	tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/install-tools/fixinc.sh \
	tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/install-tools/fixincl.exe \
	tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/install-tools/mkheaders \
	tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/install-tools/mkinstalldirs \
	tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/cc1.exe \
	tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/collect2.exe \
	tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/libgmp-3.dll \
	tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/libiconv-2.dll \
	tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/libisl-13.dll
RESOURCES43 = \
	tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/liblto_plugin-0.dll \
	tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/liblto_plugin.dll.a \
	tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/libmpc-2.dll \
	tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/libmpfr-1.dll \
	tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/lto-wrapper.exe \
	tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/lto1.exe \
	tdm/gcc-5.1.0-tdm64-1-core/licenses/COPYING.ISL.txt \
	tdm/gcc-5.1.0-tdm64-1-core/licenses/COPYING.RUNTIME-gcc-tdm.txt \
	tdm/gcc-5.1.0-tdm64-1-core/licenses/COPYING.winpthreads.txt \
	tdm/gcc-5.1.0-tdm64-1-core/licenses/COPYING3-gcc-tdm.txt \
	tdm/gcc-5.1.0-tdm64-1-core/licenses/COPYING3.LIB-gcc-tdm.txt \
	tdm/gcc-5.1.0-tdm64-1-core/licenses/README-gcc-tdm64.txt \
	tdm/gcc-5.1.0-tdm64-1-core/share/info/cpp.info \
	tdm/gcc-5.1.0-tdm64-1-core/share/info/cppinternals.info \
	tdm/gcc-5.1.0-tdm64-1-core/share/info/gcc.info \
	tdm/gcc-5.1.0-tdm64-1-core/share/info/gccinstall.info \
	tdm/gcc-5.1.0-tdm64-1-core/share/info/gccint.info \
	tdm/gcc-5.1.0-tdm64-1-core/share/info/libquadmath.info \
	tdm/gcc-5.1.0-tdm64-1-core/share/man/man1/cpp.1 \
	tdm/gcc-5.1.0-tdm64-1-core/share/man/man1/gcc.1 \
	tdm/gcc-5.1.0-tdm64-1-core/share/man/man1/gcov.1 \
	tdm/gcc-5.1.0-tdm64-1-core/share/man/man7/fsf-funding.7 \
	tdm/gcc-5.1.0-tdm64-1-core/share/man/man7/gfdl.7
RESOURCES44 = \
	tdm/gcc-5.1.0-tdm64-1-core/share/man/man7/gpl.7 \
	tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/include/pthread.h \
	tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/include/pthread_compat.h \
	tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/include/pthread_signal.h \
	tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/include/pthread_time.h \
	tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/include/pthread_unistd.h \
	tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/include/sched.h \
	tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/include/semaphore.h \
	tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/lib/libpthread.a \
	tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/lib/libpthread_s.dll.a \
	tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/lib/libwinpthread.a \
	tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/lib/libwinpthread.dll.a \
	tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/lib32/libpthread.a \
	tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/lib32/libpthread_s.dll.a \
	tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/lib32/libwinpthread.a \
	tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/lib32/libwinpthread.dll.a \
	tdm/gcc-5.1.0-tdm64-1-c++/bin/c++.exe \
	tdm/gcc-5.1.0-tdm64-1-c++/bin/g++.exe \
	tdm/gcc-5.1.0-tdm64-1-c++/bin/libstdc++-6.dll \
	tdm/gcc-5.1.0-tdm64-1-c++/bin/libstdc++_64-6.dll \
	tdm/gcc-5.1.0-tdm64-1-c++/bin/x86_64-w64-mingw32-c++.exe \
	tdm/gcc-5.1.0-tdm64-1-c++/bin/x86_64-w64-mingw32-g++.exe \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libstdc++-6.dll-gdb.py
RESOURCES45 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libstdc++.a \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libstdc++.dll.a \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libsupc++.a \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward/auto_ptr.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward/backward_warning.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward/binders.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward/hashtable.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward/hash_fun.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward/hash_map \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward/hash_set \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward/strstream \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/algorithmfwd.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/allocated_ptr.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/allocator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/alloc_traits.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/atomic_base.h
RESOURCES46 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/atomic_futex.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/atomic_lockfree_defines.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/basic_ios.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/basic_ios.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/basic_string.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/basic_string.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/boost_concept_check.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/c++0x_warning.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/c++14_warning.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/char_traits.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/codecvt.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/concept_check.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/cpp_type_traits.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/cxxabi_forced.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/deque.tcc
RESOURCES47 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/enable_special_members.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/exception_defines.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/exception_ptr.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/forward_list.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/forward_list.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/fstream.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/functexcept.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/functional_hash.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/gslice.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/gslice_array.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/hashtable.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/hashtable_policy.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/hash_bytes.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/indirect_array.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/ios_base.h
RESOURCES48 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/istream.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/list.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/localefwd.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/locale_classes.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/locale_classes.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/locale_conv.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/locale_facets.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/locale_facets.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/locale_facets_nonio.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/locale_facets_nonio.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/mask_array.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/memoryfwd.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/move.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/nested_exception.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/ostream.tcc
RESOURCES49 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/ostream_insert.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/parse_numbers.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/postypes.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/predefined_ops.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/ptr_traits.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/random.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/random.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/range_access.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_automaton.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_automaton.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_compiler.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_compiler.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_constants.h
RESOURCES50 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_error.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_executor.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_executor.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_scanner.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_scanner.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/shared_ptr.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/shared_ptr_atomic.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/shared_ptr_base.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/slice_array.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/sstream.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_algo.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_algobase.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_bvector.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_construct.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_deque.h
RESOURCES51 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_function.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_heap.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_iterator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_iterator_base_funcs.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_iterator_base_types.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_list.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_map.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_multimap.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_multiset.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_numeric.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_pair.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_queue.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_raw_storage_iter.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_relops.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_set.h
RESOURCES52 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_stack.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_tempbuf.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_tree.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_uninitialized.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_vector.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/streambuf.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/streambuf_iterator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stream_iterator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stringfwd.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/unique_ptr.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/unordered_map.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/unordered_set.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/uses_allocator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/valarray_after.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/valarray_array.h
RESOURCES53 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/valarray_array.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/valarray_before.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/vector.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/array \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/bitset \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/debug.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/deque \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/formatter.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/forward_list \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/functions.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/list \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/macros.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/map \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/map.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/multimap.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/multiset.h
RESOURCES54 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_base.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_container.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_iterator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_iterator.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_local_iterator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_local_iterator.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_sequence.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_sequence.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_unordered_base.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_unordered_container.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_unordered_container.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/set \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/set.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/string \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/unordered_map
RESOURCES55 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/unordered_set \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/vector \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/decimal/decimal \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/decimal/decimal.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/algorithm \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/any \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/chrono \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/functional \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/optional \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/ratio \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/string_view \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/string_view.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/system_error \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/tuple \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/type_traits
RESOURCES56 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/binary_heap_.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/constructors_destructor_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/const_iterator.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/debug_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/entry_cmp.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/entry_pred.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/find_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/info_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/insert_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/iterators_fn_imps.hpp
RESOURCES57 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/point_const_iterator.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/policy_access_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/resize_policy.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/split_join_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/trace_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_/binomial_heap_.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_/constructors_destructor_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_/debug_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_base_/binomial_heap_base_.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_base_/constructors_destructor_fn_imps.hpp
RESOURCES58 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_base_/debug_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_base_/erase_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_base_/find_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_base_/insert_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_base_/split_join_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/bin_search_tree_.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/constructors_destructor_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/debug_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/erase_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/find_fn_imps.hpp
RESOURCES59 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/info_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/insert_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/iterators_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/node_iterators.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/point_iterators.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/policy_access_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/rotate_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/r_erase_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/split_join_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/traits.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/branch_policy/branch_policy.hpp
RESOURCES60 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/branch_policy/null_node_metadata.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/branch_policy/traits.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/cc_ht_map_.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/cmp_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/cond_key_dtor_entry_dealtor.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/constructor_destructor_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/constructor_destructor_no_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/constructor_destructor_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/debug_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/debug_no_store_hash_fn_imps.hpp
RESOURCES61 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/debug_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/entry_list_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/erase_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/erase_no_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/erase_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/find_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/find_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/info_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/insert_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/insert_no_store_hash_fn_imps.hpp
RESOURCES62 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/insert_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/iterators_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/policy_access_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/resize_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/resize_no_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/resize_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/size_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/trace_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/eq_fn/eq_by_less.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/eq_fn/hash_eq_fn.hpp
RESOURCES63 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/constructor_destructor_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/constructor_destructor_no_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/constructor_destructor_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/debug_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/debug_no_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/debug_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/erase_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/erase_no_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/erase_store_hash_fn_imps.hpp
RESOURCES64 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/find_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/find_no_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/find_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/gp_ht_map_.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/info_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/insert_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/insert_no_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/insert_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/iterator_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/policy_access_fn_imps.hpp
RESOURCES65 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/resize_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/resize_no_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/resize_store_hash_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/trace_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/direct_mask_range_hashing_imp.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/direct_mod_range_hashing_imp.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/linear_probe_fn_imp.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/mask_based_range_hashing.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/mod_based_range_hashing.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/probe_fn_base.hpp
RESOURCES66 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/quadratic_probe_fn_imp.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/ranged_hash_fn.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/ranged_probe_fn.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/sample_probe_fn.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/sample_ranged_hash_fn.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/sample_ranged_probe_fn.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/sample_range_hashing.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/constructors_destructor_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/const_iterator.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/debug_fn_imps.hpp
RESOURCES67 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/erase_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/info_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/insert_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/iterators_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/left_child_next_sibling_heap_.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/node.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/point_const_iterator.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/policy_access_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/trace_fn_imps.hpp
RESOURCES68 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/constructor_destructor_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/debug_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/entry_metadata_base.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/erase_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/find_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/info_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/insert_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/iterators_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/lu_map_.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/trace_fn_imps.hpp
RESOURCES69 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_policy/lu_counter_metadata.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_policy/sample_update_policy.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/constructors_destructor_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/debug_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/erase_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/info_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/insert_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/iterators_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/node_iterators.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/ov_tree_map_.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/policy_access_fn_imps.hpp
RESOURCES70 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/split_join_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/traits.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pairing_heap_/constructors_destructor_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pairing_heap_/debug_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pairing_heap_/erase_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pairing_heap_/find_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pairing_heap_/insert_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pairing_heap_/pairing_heap_.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pairing_heap_/split_join_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/constructors_destructor_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/debug_fn_imps.hpp
RESOURCES71 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/erase_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/find_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/info_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/insert_join_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/iterators_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/pat_trie_.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/pat_trie_base.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/policy_access_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/rotate_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/r_erase_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/split_fn_imps.hpp
RESOURCES72 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/synth_access_traits.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/trace_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/traits.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/update_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/constructors_destructor_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/debug_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/erase_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/find_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/info_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/insert_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/node.hpp
RESOURCES73 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/rb_tree_.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/split_join_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/traits.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_/constructors_destructor_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_/debug_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_/erase_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_/insert_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_/rc.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_/rc_binomial_heap_.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_/split_join_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_/trace_fn_imps.hpp
RESOURCES74 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/cc_hash_max_collision_check_resize_trigger_imp.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/hash_exponential_size_policy_imp.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/hash_load_check_resize_trigger_imp.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/hash_load_check_resize_trigger_size_base.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/hash_prime_size_policy_imp.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/hash_standard_resize_policy_imp.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/sample_resize_policy.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/sample_resize_trigger.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/sample_size_policy.hpp
RESOURCES75 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/constructors_destructor_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/debug_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/erase_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/find_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/info_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/insert_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/node.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/splay_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/splay_tree_.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/split_join_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/traits.hpp
RESOURCES76 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_/constructors_destructor_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_/debug_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_/erase_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_/find_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_/insert_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_/split_join_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_/thin_heap_.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_/trace_fn_imps.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/tree_policy/node_metadata_selector.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/tree_policy/order_statistics_imp.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/tree_policy/sample_tree_node_update.hpp
RESOURCES77 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/trie_policy/node_metadata_selector.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/trie_policy/order_statistics_imp.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/trie_policy/prefix_search_node_update_imp.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/trie_policy/sample_trie_access_traits.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/trie_policy/sample_trie_node_update.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/trie_policy/trie_policy_base.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/trie_policy/trie_string_access_traits_imp.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/unordered_iterator/const_iterator.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/unordered_iterator/iterator.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/unordered_iterator/point_const_iterator.hpp
RESOURCES78 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/unordered_iterator/point_iterator.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cond_dealtor.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/container_base_dispatch.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/debug_map_base.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/priority_queue_base_dispatch.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/standard_policies.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/tree_trace_base.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/types_traits.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/type_utils.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/assoc_container.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/exception.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/hash_policy.hpp
RESOURCES79 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/list_update_policy.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/priority_queue.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/tag_and_trait.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/tree_policy.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/trie_policy.hpp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/algorithm \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/aligned_buffer.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/alloc_traits.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/array_allocator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/atomicity.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/bitmap_allocator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/cast.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/cmath \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/codecvt_specializations.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/concurrence.h
RESOURCES80 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/debug_allocator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/enc_filebuf.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/extptr_allocator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/functional \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/hash_map \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/hash_set \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/iterator \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/malloc_allocator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/memory \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/mt_allocator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/new_allocator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/numeric \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/numeric_traits.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pod_char_traits.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pointer.h
RESOURCES81 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pool_allocator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/random \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/random.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/rb_tree \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/rc_string_base.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/rope \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/ropeimpl.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/slist \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/sso_string_base.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/stdio_filebuf.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/stdio_sync_filebuf.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/string_conversions.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/throw_allocator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/typelist.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/type_traits.h
RESOURCES82 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/vstring.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/vstring.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/vstring_fwd.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/vstring_util.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/algo.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/algobase.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/algorithm \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/algorithmfwd.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/balanced_quicksort.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/base.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/basic_iterator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/checkers.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/compatibility.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/compiletime_settings.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/equally_split.h
RESOURCES83 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/features.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/find.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/find_selectors.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/for_each.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/for_each_selectors.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/iterator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/list_partition.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/losertree.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/merge.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/multiseq_selection.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/multiway_merge.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/multiway_mergesort.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/numeric \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/numericfwd.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/omp_loop.h
RESOURCES84 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/omp_loop_static.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/parallel.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/partial_sum.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/partition.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/par_loop.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/queue.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/quicksort.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/random_number.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/random_shuffle.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/search.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/settings.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/set_operations.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/sort.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/tags.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/types.h
RESOURCES85 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/unique_copy.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/workstealing.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_algos.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_container_size.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_hashtable_size.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_hash_func.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_list_to_slist.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_list_to_vector.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_map_to_unordered_map.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_node.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_state.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_trace.h
RESOURCES86 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_vector_size.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_vector_to_list.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/array \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/base.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/bitset \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/deque \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/forward_list \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/iterator_tracker.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/list \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/map \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/map.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/multimap.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/multiset.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/ordered_base.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/set
RESOURCES87 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/set.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/unordered_base.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/unordered_map \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/unordered_set \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/vector \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/array \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/bessel_function.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/beta_function.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/ccomplex \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cctype \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cfenv \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cfloat \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cinttypes \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/climits \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cmath \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/complex
RESOURCES88 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/complex.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cstdarg \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cstdbool \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cstdint \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cstdio \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cstdlib \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/ctgmath \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/ctime \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/ctype.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cwchar \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cwctype \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/ell_integral.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/exp_integral.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/fenv.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/float.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/functional
RESOURCES89 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/functional_hash.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/gamma.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/hashtable.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/hashtable_policy.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/hypergeometric.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/inttypes.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/legendre_function.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/limits.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/math.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/memory \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/modified_bessel_func.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/poly_hermite.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/poly_laguerre.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/random \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/random.h
RESOURCES90 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/random.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/regex \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/riemann_zeta.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/shared_ptr.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/special_function_util.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/stdarg.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/stdbool.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/stdint.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/stdio.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/stdlib.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/tgmath.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/tuple \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/type_traits \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/unordered_map \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/unordered_map.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/unordered_set
RESOURCES91 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/unordered_set.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/utility \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/wchar.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/wctype.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr2/bool_set \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr2/bool_set.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr2/dynamic_bitset \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr2/dynamic_bitset.tcc \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr2/ratio \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr2/type_traits \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/atomic_word.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/basic_file.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/c++allocator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/c++config.h
RESOURCES92 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/c++io.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/c++locale.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/cpu_defines.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/ctype_base.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/ctype_inline.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/cxxabi_tweaks.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/error_constants.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/extc++.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/gthr-default.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/gthr-posix.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/gthr-single.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/gthr.h
RESOURCES93 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/messages_members.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/opt_random.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/os_defines.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/stdc++.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/stdtr1c++.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/time_members.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/ext/opt_random.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/atomic_word.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/basic_file.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/c++allocator.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/c++config.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/c++io.h
RESOURCES94 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/c++locale.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/cpu_defines.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/ctype_base.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/ctype_inline.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/cxxabi_tweaks.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/error_constants.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/extc++.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/gthr-default.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/gthr-posix.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/gthr-single.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/gthr.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/messages_members.h
RESOURCES95 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/opt_random.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/os_defines.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/stdc++.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/stdtr1c++.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/time_members.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/ext/opt_random.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/algorithm \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/array \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/atomic \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bitset \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cassert \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ccomplex \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cctype \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cerrno \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cfenv
RESOURCES96 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cfloat \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/chrono \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cinttypes \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ciso646 \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/climits \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/clocale \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cmath \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/codecvt \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/complex \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/complex.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/condition_variable \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/csetjmp \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/csignal \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cstdalign \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cstdarg \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cstdbool \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cstddef
RESOURCES97 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cstdint \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cstdio \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cstdlib \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cstring \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ctgmath \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ctime \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cwchar \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cwctype \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cxxabi.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/deque \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/exception \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/fenv.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/forward_list \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/fstream \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/functional \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/future \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/initializer_list
RESOURCES98 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/iomanip \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ios \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/iosfwd \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/iostream \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/istream \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/iterator \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/limits \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/list \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/locale \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/map \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/memory \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/mutex \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/new \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/numeric \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ostream \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/queue \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/random \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ratio
RESOURCES99 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/regex \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/scoped_allocator \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/set \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/shared_mutex \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/sstream \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/stack \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/stdexcept \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/streambuf \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/string \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/system_error \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tgmath.h \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/thread \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tuple \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/typeindex \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/typeinfo \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/type_traits \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/unordered_map
RESOURCES100 = \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/unordered_set \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/utility \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/valarray \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/vector \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/libstdc++.a \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/libstdc++.dll.a \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/libstdc++_64-6.dll-gdb.py \
	tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/libsupc++.a \
	tdm/gcc-5.1.0-tdm64-1-c++/libexec/gcc/x86_64-w64-mingw32/5.1.0/cc1plus.exe \
	tdm/gcc-5.1.0-tdm64-1-c++/licenses/COPYING.ISL.txt \
	tdm/gcc-5.1.0-tdm64-1-c++/licenses/COPYING.RUNTIME-gcc-tdm.txt \
	tdm/gcc-5.1.0-tdm64-1-c++/licenses/COPYING.winpthreads.txt \
	tdm/gcc-5.1.0-tdm64-1-c++/licenses/COPYING3-gcc-tdm.txt \
	tdm/gcc-5.1.0-tdm64-1-c++/licenses/COPYING3.LIB-gcc-tdm.txt \
	tdm/gcc-5.1.0-tdm64-1-c++/share/gcc-5.1.0/python/libstdcxx/v6/printers.py \
	tdm/gcc-5.1.0-tdm64-1-c++/share/gcc-5.1.0/python/libstdcxx/v6/xmethods.py \
	tdm/gcc-5.1.0-tdm64-1-c++/share/gcc-5.1.0/python/libstdcxx/v6/__init__.py \
	tdm/gcc-5.1.0-tdm64-1-c++/share/gcc-5.1.0/python/libstdcxx/__init__.py \
	tdm/gcc-5.1.0-tdm64-1-c++/share/man/man1/g++.1 \
	tdm/make-3.82.90/bin/mingw32-make.exe \
	tdm/make-3.82.90/licenses/COPYING
RESOURCES101 = \
	tdm/libgnurx-2.7/bin/gnurx-0.dll \
	tdm/libgnurx-2.7/include/regex.h
RESOURCES91 = \
	tdm/libgnurx-2.5.1-32/bin/libgnurx-0.dll \
	tdm/libgnurx-2.7/include/regex.h \
	tdm/binutils-2.25-tdm64-1/share/info/as.info \
	tdm/binutils-2.25-tdm64-1/share/info/bfd.info \
	tdm/binutils-2.25-tdm64-1/share/info/binutils.info \
	tdm/binutils-2.25-tdm64-1/share/info/gprof.info \
	tdm/binutils-2.25-tdm64-1/share/info/ld.info \
	tdm/doc/binutils/man/man1/addr2line.1 \
	tdm/doc/binutils/man/man1/ar.1 \
	tdm/doc/binutils/man/man1/as.1 \
	tdm/doc/binutils/man/man1/c++filt.1 \
	tdm/doc/binutils/man/man1/dlltool.1 \
	tdm/doc/binutils/man/man1/elfedit.1 \
	tdm/doc/binutils/man/man1/gprof.1 \
	tdm/doc/binutils/man/man1/ld.1 \
	tdm/doc/binutils/man/man1/nlmconv.1 \
	tdm/doc/binutils/man/man1/nm.1 \
	tdm/doc/binutils/man/man1/objcopy.1 \
	tdm/doc/binutils/man/man1/objdump.1 \
	tdm/doc/binutils/man/man1/ranlib.1 \
	tdm/doc/binutils/man/man1/readelf.1 \
	tdm/doc/binutils/man/man1/size.1 \
	tdm/doc/binutils/man/man1/strings.1 \
	tdm/doc/binutils/man/man1/strip.1 \
	tdm/doc/binutils/man/man1/windmc.1 \
	tdm/doc/binutils/man/man1/windres.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/addr2line.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/ar.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/as.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/c++filt.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/dlltool.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/elfedit.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/gprof.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/ld.1
RESOURCES102 = \
	tdm/binutils-2.25-tdm64-1/share/man/man1/nlmconv.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/nm.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/objcopy.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/objdump.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/ranlib.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/readelf.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/size.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/strings.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/strip.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/windmc.1 \
	tdm/binutils-2.25-tdm64-1/share/man/man1/windres.1 \
	tdm/gcc-5.1.0-tdm64-1-c++/share/man/man1/g++.1 \
	tdm/gcc-5.1.0-tdm64-1-core/share/info/cpp.info \
	tdm/gcc-5.1.0-tdm64-1-core/share/info/cppinternals.info \
	tdm/gcc-5.1.0-tdm64-1-core/share/info/gcc.info \
	tdm/gcc-5.1.0-tdm64-1-core/share/info/gccinstall.info \
	tdm/gcc-5.1.0-tdm64-1-core/share/info/gccint.info \
	tdm/gcc-5.1.0-tdm64-1-core/share/info/libquadmath.info \
	tdm/gcc-5.1.0-tdm64-1-core/share/man/man1/cpp.1 \
	tdm/gcc-5.1.0-tdm64-1-core/share/man/man1/gcc.1 \
	tdm/gcc-5.1.0-tdm64-1-core/share/man/man1/gcov.1 \
	tdm/gcc-5.1.0-tdm64-1-core/share/man/man7/fsf-funding.7 \
	tdm/gcc-5.1.0-tdm64-1-core/share/man/man7/gfdl.7 \
	tdm/gcc-5.1.0-tdm64-1-core/share/man/man7/gpl.7 \
	tdm/doc/gdb/info/gdb.info \
	tdm/doc/gdb/man/gdb.1 \
	tdm/doc/gnurx/info/regex.info \
	tdm/doc/gnurx/man/man3/regcomp.3 \
	tdm/doc/gnurx/man/man3/regerror.3 \
	tdm/doc/gnurx/man/man3/regex.3 \
	tdm/doc/gnurx/man/man3/regexec.3
RESOURCES103 = \
	tdm/doc/gnurx/man/man3/regfree.3 \
	tdm/doc/make/info/make.info \
	tdm/doc/make/info/make.info-1 \
	tdm/doc/make/info/make.info-2 \
	tdm/doc/make/man/man1/mingw32-make.1 \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/licenses/COPYING.LIB.txt \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/licenses/COPYING.MinGW-w64-runtime.txt \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/licenses/COPYING.MinGW-w64.txt \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/licenses/COPYING.winpthreads.txt \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/bin/gendef.exe \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/bin/genidl.exe \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/acpiioct.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/afilter.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/amtvuids.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/atm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/bdasup.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/classpnp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/csq.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/d3dhal.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/d3dhalex.h
RESOURCES104 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/d4drvif.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/d4iface.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/dderror.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/dmusicks.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/drivinit.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/drmk.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/dxapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/fltsafe.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/hidclass.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/hubbusif.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ide.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ioaccess.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/kbdmou.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/mcd.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/mce.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/miniport.h
RESOURCES105 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/minitape.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/mountdev.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/mountmgr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/msports.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ndis.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ndisguid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ndistapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ndiswan.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/netpnp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntagp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntddk.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntddpcm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntddsnd.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntifs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntimage.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntnls.h
RESOURCES106 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntpoapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntstrsafe.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/oprghdlr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/parallel.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/pfhook.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/poclass.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/portcls.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/punknown.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/scsi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/scsiscan.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/scsiwmi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/smbus.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/srb.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/stdunk.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/storport.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/strmini.h
RESOURCES107 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/swenum.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/tdikrnl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/tdistat.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/upssvc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/usbbusif.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/usbdlib.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/usbdrivr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/usbkern.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/usbprint.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/usbprotocoldefs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/usbscan.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/usbstorioctl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/video.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/videoagp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/wdm.h
RESOURCES108 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/wdmguid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/wmidata.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/wmilib.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ws2san.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/xfilter.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplus.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusbase.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusbrush.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdipluscolor.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdipluscolormatrix.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdipluseffects.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusenums.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusflat.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusgpstubs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusgraphics.h
RESOURCES109 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusheaders.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusimageattributes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusimagecodec.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusimaging.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusimpl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusinit.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdipluslinecaps.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusmatrix.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusmem.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusmetafile.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusmetaheader.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdipluspath.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdipluspen.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdipluspixelformats.h
RESOURCES110 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusstringformat.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplustypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/GL/gl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/GL/glaux.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/GL/glcorearb.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/GL/glext.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/GL/glu.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/GL/glxext.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/GL/wglext.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/intrin-impl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_dbg_common.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_dbg_LOAD_IMAGE.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_fd_types.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_ip_mreq1.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_ip_types.h
RESOURCES111 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_pop_BOOL.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_push_BOOL.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_socket_types.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_varenum.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_ws1_undef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_wsadata.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_wsa_errnos.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_xmitfile.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sdks/_mingw_ddk.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sdks/_mingw_directx.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/sys/timeb_s.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/conio_s.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/crtdbg_s.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/io_s.h
RESOURCES112 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/mbstring_s.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/memory_s.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/search_s.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/stdio_s.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/stdlib_s.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/stralign_s.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/string_s.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/tchar_s.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/wchar_s.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/cdefs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/fcntl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/file.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/locking.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/param.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/stat.h
RESOURCES113 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/time.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/timeb.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/types.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/unistd.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/utime.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/accctrl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/aclapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/aclui.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/activation.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/activaut.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/activdbg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/activdbg100.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/activecf.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/activeds.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/activprof.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/activscp.h
RESOURCES114 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adhoc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/admex.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adoctint.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adodef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adogpool.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adogpool_backcompat.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adoguids.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adoid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adoint.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adoint_backcompat.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adojet.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adomd.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adptif.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adsdb.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adserr.h
RESOURCES115 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adshlp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adsiid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adsnms.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adsprop.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adssts.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adtgen.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/advpub.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/afxres.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/af_irda.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/agtctl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/agtctl_i.c \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/agterr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/agtsvr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/agtsvr_i.c \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/alg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/alink.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/amaudio.h
RESOURCES116 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/amstream.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/amstream.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/amvideo.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/amvideo.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/apdevpkey.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/apiset.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/apisetcconv.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/appmgmt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/aqadmtyp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/asptlb.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/assert.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/atacct.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/atalkwsh.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/atsmedia.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/audevcod.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/audioapotypes.h
RESOURCES117 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/audioclient.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/audioendpoints.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/audioengineendpoint.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/audiopolicy.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/audiosessiontypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/austream.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/austream.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/authif.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/authz.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/aux_ulib.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/avifmt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/aviriff.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/avrfsdk.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/avrt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/axextendenums.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/azroles.h
RESOURCES118 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/basetsd.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/basetyps.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/batclass.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bcrypt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bdaiface.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bdamedia.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bdatypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bemapiset.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bh.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bidispl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bits.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bits1_5.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bits2_0.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bitscfg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bitsmsg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/blberr.h
RESOURCES119 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bluetoothapis.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bthdef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bthsdpdef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bugcodes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/callobj.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cardmod.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/casetup.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cchannel.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cderr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdoex.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdoexerr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdoexm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdoexm_i.c \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdoexstr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdoex_i.c \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdonts.h
RESOURCES120 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdosys.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdosyserr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdosysstr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdosys_i.c \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/celib.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certadm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certbase.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certbcli.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certcli.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certenc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certenroll.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certexit.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certif.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certmod.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certpol.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certreqd.h
RESOURCES121 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certsrv.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certview.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cfg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cfgmgr32.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cguid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/chanmgr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cierror.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/clfs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/clfsmgmt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/clfsmgmtw32.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/clfsw32.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cluadmex.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/clusapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cluscfgguids.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cluscfgserver.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cluscfgwizard.h
RESOURCES122 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cmdtree.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cmnquery.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/codecapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/color.dlg \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/colordlg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/comadmin.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/combaseapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/comcat.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/comdef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/comdefsp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/comip.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/comlite.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/commapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/commctrl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/commctrl.rh \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/commdlg.h
RESOURCES123 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/common.ver \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/commoncontrols.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/complex.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/compobj.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/compressapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/compstui.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/comsvcs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/comutil.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/confpriv.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/conio.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/control.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cor.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/corerror.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/corhdr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/correg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cpl.h
RESOURCES124 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cplext.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/credssp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/crtdbg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/crtdefs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cryptuiapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cryptxml.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cscapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cscobj.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ctfutb.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ctxtcall.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ctype.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/custcntl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2d1.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2d1effectauthor.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2d1effecthelpers.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2d1effects.h
RESOURCES125 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2d1helper.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2d1_1.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2d1_1helper.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2dbasetypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2derr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d10.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d10.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d10effect.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d10misc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d10shader.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d10_1.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d10_1.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d10_1shader.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d11.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d11.idl
RESOURCES126 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d11sdklayers.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d11sdklayers.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d11shader.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d11_1.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d11_1.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d8.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d8caps.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d8types.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d9.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d9caps.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d9types.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dcaps.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dcommon.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dcommon.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dcompiler.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dhal.h
RESOURCES127 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3drm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3drmdef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3drmobj.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dtypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dvec.inl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9anim.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9core.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9effect.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9math.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9math.inl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9mesh.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9shader.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9shape.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9tex.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9xof.h
RESOURCES128 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/daogetrw.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/datapath.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/datetimeapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/davclnt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dbdaoerr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dbdaoid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dbdaoint.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dbgautoattach.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dbgeng.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dbghelp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dbgprop.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dbt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dciddi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dciman.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dcommon.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dde.h
RESOURCES129 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dde.rh \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddeml.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddraw.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddrawgdi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddrawi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddstream.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddstream.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/debugapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/delayimp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/devguid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/devicetopology.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/devioctl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/devpkey.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/devpropdef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dhcpcsdk.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dhcpsapi.h
RESOURCES130 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dhcpssdk.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dhcpv6csdk.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dhtmldid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dhtmled.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dhtmliid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/digitalv.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dimm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dinput.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dir.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/direct.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dirent.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/diskguid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dispatch.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dispdib.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dispex.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dlcapi.h
RESOURCES131 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dlgs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dls1.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dls2.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmdls.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmemmgr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmerror.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmksctrl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmo.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmodshow.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmodshow.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmoreg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmort.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmplugin.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmusbuff.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmusicc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmusicf.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmusici.h
RESOURCES132 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmusics.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/docobj.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/docobjectservice.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/documenttarget.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/domdid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dos.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/downloadmgr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dpaddr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dpapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dpfilter.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dplay.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dplay8.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dplobby.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dplobby8.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dpnathlp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/driverspecs.h
RESOURCES133 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dsadmin.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dsclient.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dsconf.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dsdriver.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dsgetdc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dshow.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dskquota.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dsound.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dsquery.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dsrole.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dssec.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dtchelp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dvbsiparser.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dvdevcod.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dvdmedia.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dvec.h
RESOURCES134 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dvobj.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dwmapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dwrite.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dwrite_1.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxdiag.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxerr8.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxerr9.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxfile.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxgi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxgi.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxgi1_2.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxgi1_2.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxgiformat.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxgitype.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxtmpl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxva.h
RESOURCES135 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxva2api.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxvahd.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eapauthenticatoractiondefine.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eapauthenticatortypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eaphosterror.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eaphostpeerconfigapis.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eaphostpeertypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eapmethodauthenticatorapis.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eapmethodpeerapis.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eapmethodtypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eappapis.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eaptypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/edevdefs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eh.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ehstorapi.h
RESOURCES136 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/elscore.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/emostore.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/emostore_i.c \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/emptyvc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/endpointvolume.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/errhandlingapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/errno.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/error.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/errorrep.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/errors.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/esent.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/evcode.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/evcoll.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eventsys.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/evntcons.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/evntprov.h
RESOURCES137 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/evntrace.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/evr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/evr9.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/exchform.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/excpt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/exdisp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/exdispid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fci.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fcntl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fdi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fenv.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fibersapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fileapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fileextd.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/filehc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fileopen.dlg \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/filter.h
RESOURCES138 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/filterr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/findtext.dlg \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/float.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fltdefs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fltuser.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fltuserstructures.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fltwinerror.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/font.dlg \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fpieee.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fsrm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fsrmenums.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fsrmerr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fsrmpipeline.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fsrmquota.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fsrmreports.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fsrmscreen.h
RESOURCES139 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ftsiface.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ftw.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/functiondiscoveryapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/functiondiscoverycategories.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/functiondiscoveryconstraints.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/functiondiscoverykeys.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/functiondiscoverykeys_devpkey.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/functiondiscoverynotification.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fusion.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fvec.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fwpmtypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fwpmu.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fwptypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gb18030.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus.h
RESOURCES140 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/getopt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gpedit.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gpio.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gpmgmt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/guiddef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/h323priv.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/handleapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/heapapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hidclass.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hidpi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hidsdi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hidusage.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/highlevelmonitorconfigurationapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hlguids.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hliface.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hlink.h
RESOURCES141 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hostinfo.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hstring.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/htiface.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/htiframe.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/htmlguid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/htmlhelp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/http.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/httpext.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/httpfilt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/httprequestid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ia64reg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iaccess.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iadmext.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iadmw.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iads.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/icftypes.h
RESOURCES142 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/icm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/icmpapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/icmui.dlg \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/icodecapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/icrsint.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/identitycommon.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/identitystore.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/idf.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/idispids.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iedial.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ieeefp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ieverp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ifdef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iiis.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iiisext.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iimgctx.h
RESOURCES143 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iiscnfg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iisext_i.c \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iisrsta.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iketypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ilogobj.hxx \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/imagehlp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ime.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/imessage.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/imm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/in6addr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/inaddr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/indexsrv.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/inetreg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/inetsdk.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/initguid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/initoid.h
RESOURCES144 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/inputscope.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/inspectable.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/interlockedapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/intrin.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/intshcut.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/inttypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/invkprxy.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/io.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ioapiset.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ioevent.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipexport.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iphlpapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipifcons.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipinfoid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipmib.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipmsp.h
RESOURCES145 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iprtrmib.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipsectypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iptypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipxconst.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipxrip.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipxrtdef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipxsap.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipxtfflt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iscsidsc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/isguids.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/issper16.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/issperr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/isysmon.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ivec.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iwamreg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/i_cryptasn1tls.h
RESOURCES146 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/jobapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/kcom.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/knownfolders.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ks.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ksdebug.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ksguid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ksmedia.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ksproxy.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ksuuids.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ktmtypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ktmw32.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/kxia64.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/l2cmn.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/libgen.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/libloaderapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/libmangle.h
RESOURCES147 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/limits.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmaccess.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmalert.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmapibuf.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmat.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmaudit.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmconfig.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmcons.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmdfs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmerr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmerrlog.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmjoin.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmmsg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmon.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmremutl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmrepl.h
RESOURCES148 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmserver.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmshare.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmsname.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmstats.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmsvc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmuse.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmuseflg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmwksta.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/loadperf.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/locale.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/locationapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lpmapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lzexpand.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/madcapcl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mailmsgprops.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/malloc.h
RESOURCES149 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/manipulations.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapicode.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapidbg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapidefs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapiform.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapiguid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapihook.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapinls.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapioid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapispi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapitags.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapiutil.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapival.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapiwin.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapiwz.h
RESOURCES150 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapix.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/math.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mbctype.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mbstring.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mciavi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mcx.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mdbrole.hxx \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mdcommsg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mddefw.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mdhcp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mdmsg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mediaerr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mediaobj.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mediaobj.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/medparam.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/medparam.idl
RESOURCES151 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mem.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/memory.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/memoryapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mergemod.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mfapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mferror.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mfidl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mfmp2dlna.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mfobjects.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mfplay.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mfreadwrite.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mftransform.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mgm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mgmtapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/midles.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mimedisp.h
RESOURCES152 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mimeinfo.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/minmax.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/minwinbase.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/minwindef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mlang.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mmc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mmcobj.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mmdeviceapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mmreg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mmstream.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mmstream.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mmsystem.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mobsync.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/moniker.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mpeg2bits.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mpeg2data.h
RESOURCES153 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mpeg2psiparser.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mpeg2structs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mprapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mprerror.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mq.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mqmail.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mqoai.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msacm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msacmdlg.dlg \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msacmdlg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msado15.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msasn1.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msber.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mscat.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mschapp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msclus.h
RESOURCES154 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mscoree.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msctf.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msctfmonitorapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdadc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdaguid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdaipp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdaipper.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdaora.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdaosp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdasc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdasql.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdatsrc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdrm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdrmdefs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdshape.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msfs.h
RESOURCES155 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mshtmcid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mshtmdid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mshtmhst.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mshtml.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mshtmlc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msidefs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msimcntl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msimcsdk.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msiquery.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msoav.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msopc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspab.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspaddr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspbase.h
RESOURCES156 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspcall.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspcoll.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspenum.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msplog.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspst.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspstrm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspterm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspthrd.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msptrmac.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msptrmar.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msptrmvc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msputils.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msrdc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msremote.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mssip.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msstkppg.h
RESOURCES157 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mstask.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mstcpip.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msterr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mswsock.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msxml.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msxml2.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msxml2did.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msxmldid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtsadmin.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtsadmin_i.c \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtsevents.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtsgrp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtx.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtxadmin.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtxadmin_i.c \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtxattr.h
RESOURCES158 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtxdm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/muiload.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/multimon.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/multinfo.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mxdc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/namedpipeapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/namespaceapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napcertrelyingparty.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napcommon.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napenforcementclient.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napmanagement.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napmicrosoftvendorids.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napprotocol.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napservermanagement.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napsystemhealthagent.h
RESOURCES159 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napsystemhealthvalidator.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/naptypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/naputil.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/nb30.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ncrypt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ndattrib.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ndfapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ndhelper.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ndkinfo.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ndr64types.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ndrtypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/netcon.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/neterr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/netevent.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/netioapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/netlistmgr.h
RESOURCES160 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/netmon.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/netprov.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/nettypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/new.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/newapis.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/newdev.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/nldef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/nmsupp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/npapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/nsemail.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/nspapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntdd1394.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntdd8042.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddbeep.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddcdrm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddcdvd.h
RESOURCES161 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddchgr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntdddisk.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddft.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddkbd.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddmmc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddmodm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddmou.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddndis.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddpar.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddpsch.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddscsi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddser.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddstor.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddtape.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddtdi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddvdeo.h
RESOURCES162 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddvol.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntdef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntdsapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntdsbcli.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntdsbmsg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntgdi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntiologc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntldap.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntmsapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntmsmli.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntquery.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntsdexts.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntsecapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntsecpkg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntstatus.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntverp.h
RESOURCES163 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oaidl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/objbase.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/objectarray.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/objerror.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/objidl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/objidlbase.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/objsafe.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/objsel.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ocidl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ocmm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/odbcinst.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/odbcss.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ole.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ole2.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ole2ver.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oleacc.h
RESOURCES164 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oleauto.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/olectl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/olectlid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oledb.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oledbdep.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oledberr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oledbguid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oledlg.dlg \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oledlg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oleidl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oletx2xa.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/opmapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/optary.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/p2p.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/packoff.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/packon.h
RESOURCES165 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/parser.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/patchapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/patchwiz.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pathcch.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pbt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pchannel.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pciprop.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pcrt32.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pdh.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pdhmsg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/penwin.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/perflib.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/perhist.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/persist.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pgobootrun.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/physicalmonitorenumerationapi.h
RESOURCES166 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pla.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pnrpdef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pnrpns.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/poclass.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/polarity.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/poppack.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/portabledeviceconnectapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/portabledevicetypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/powrprof.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/prnasnot.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/prnsetup.dlg \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/prntfont.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/process.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/processenv.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/processthreadsapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/processtopologyapi.h
RESOURCES167 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/profile.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/profileapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/profinfo.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/propidl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/propkey.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/propkeydef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/propsys.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/propvarutil.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/prsht.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pshpack1.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pshpack2.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pshpack4.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pshpack8.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pshpck16.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pstore.h
RESOURCES168 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qedit.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qedit.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qmgr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qnetwork.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qnetwork.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qos.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qos2.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qosname.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qospol.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qossp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ras.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rasdlg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/raseapif.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/raserror.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rassapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rasshost.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ratings.h
RESOURCES169 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rdpencomapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/realtimeapiset.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/reason.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/recguids.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/reconcil.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/regstr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rend.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/resapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/restartmanager.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/richedit.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/richole.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rkeysvcc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rnderr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/roapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/routprot.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpc.h
RESOURCES170 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcasync.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcdce.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcdcep.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcndr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcnsi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcnsip.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcnterr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcproxy.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcsal.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcssl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rrascfg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rtcapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rtccore.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rtcerr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rtinfo.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rtm.h
RESOURCES171 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rtmv2.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rtutils.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sal.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sapi51.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sapi53.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sapi54.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sas.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sbe.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scarddat.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scarderr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scardmgr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scardsrv.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scardssp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scardssp_i.c \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scardssp_p.c \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scesvc.h
RESOURCES172 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/schannel.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/schedule.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/schemadef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/schnlsp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scode.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scrnsave.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scrptids.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sddl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sdkddkver.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sdoias.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sdpblb.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sdperr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/search.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/secext.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/security.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/securityappcontainer.h
RESOURCES173 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/securitybaseapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sehmap.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sens.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sensapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sensevts.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sensors.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sensorsapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/servprov.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/setjmp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/setjmpex.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/setupapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sfc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shappmgr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/share.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shdeprecated.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shdispid.h
RESOURCES174 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shellapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sherrors.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shfolder.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shldisp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shlguid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shlobj.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shlwapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shobjidl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shtypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/signal.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/simpdata.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/simpdc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sipbase.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sisbkup.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/slerror.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/slpublic.h
RESOURCES175 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/smpab.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/smpms.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/smpxp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/smtpguid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/smx.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/snmp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/softpub.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/specstrings.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sporder.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sql.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sqlext.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sqloledb.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sqltypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sqlucode.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sql_1.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/srrestoreptapi.h
RESOURCES176 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/srv.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sspguid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sspi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sspserr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sspsidl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stdarg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stddef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stdexcpt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stdint.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stdio.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stdlib.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sti.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stierr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stireg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stllock.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/storage.h
RESOURCES177 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/storduid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/storprop.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stralign.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/string.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stringapiset.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/strings.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/strmif.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/strsafe.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/structuredquerycondition.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/subauth.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/subsmgr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/svcguid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/svrapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/swprintf.inl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/synchapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sysinfoapi.h
RESOURCES178 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/syslimits.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/systemtopologyapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/t2embapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tabflicks.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tapi3.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tapi3cc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tapi3ds.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tapi3err.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tapi3if.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/taskschd.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tbs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tcerror.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tcguid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tchar.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tcpestats.h
RESOURCES179 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tcpmib.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tdh.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tdi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tdiinfo.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/termmgr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/textserv.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/textstor.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/threadpoolapiset.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/threadpoollegacyapiset.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/time.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/timeprov.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/timezoneapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tlbref.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tlhelp32.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tlogstg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tmschema.h
RESOURCES180 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tnef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tom.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tpcshrd.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/traffic.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/transact.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/triedcid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/triediid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/triedit.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tsattrs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tspi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tssbx.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tsuserex.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tsuserex_i.c \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tuner.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tvout.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/txcoord.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/txctx.h
RESOURCES181 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/txdtc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/txfw32.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/typeinfo.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/uastrfnc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/uchar.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/udpmib.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/uiautomation.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/uiautomationclient.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/uiautomationcore.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/uiautomationcoreapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/umx.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/unistd.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/unknown.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/unknwn.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/unknwnbase.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/urlhist.h
RESOURCES182 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/urlmon.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usb.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usb100.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usb200.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbcamdi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbdi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbioctl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbiodef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbprint.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbrpmif.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbscan.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbspec.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbuser.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/userenv.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usp10.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/utilapiset.h
RESOURCES183 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/utime.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/uuids.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/uxtheme.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vadefs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/varargs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vcr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vdmdbg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vds.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vdslun.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/verinfo.ver \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vfw.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vfwmsgs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/virtdisk.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vmr9.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vmr9.idl \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vsadmin.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vsbackup.h
RESOURCES184 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vsmgmt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vsprov.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vss.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vsstyle.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vssym32.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vswriter.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/w32api.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wab.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wabapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wabcode.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wabdefs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wabiab.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wabmem.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wabnot.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wabtags.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wabutil.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wbemads.h
RESOURCES185 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wbemcli.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wbemdisp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wbemidl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wbemprov.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wbemtran.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wchar.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wcmconfig.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wcsplugin.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wct.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wctype.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wdsbp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wdsclientapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wdspxe.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wdstci.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wdstpdi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wdstptmgmt.h
RESOURCES186 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/werapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wfext.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wia.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wiadef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wiadevd.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wiavideo.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winable.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winapifamily.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winbase.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winber.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wincodec.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wincon.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wincred.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wincrypt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winddi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winddiui.h
RESOURCES187 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windns.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windot11.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windows.foundation.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windows.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windows.security.cryptography.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windows.storage.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windows.storage.streams.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windows.system.threading.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windowsx.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windowsx.h16 \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winefs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winerror.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winevt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wingdi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winhttp.h
RESOURCES188 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wininet.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winineti.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winioctl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winldap.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winnetwk.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winnls.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winnls32.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winnt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winnt.rh \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winperf.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winreg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winresrc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsafer.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsatcominterfacei.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winscard.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsdkver.h
RESOURCES189 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsmcrd.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsnmp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsock.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsock2.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsplp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winspool.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winstring.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsvc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsxs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsync.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winternl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wintrust.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winusb.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winusbio.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winuser.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winuser.rh
RESOURCES190 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winver.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winwlx.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wlanapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wlanihvtypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wlantypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wmcodecdsp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wmcontainer.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wmiatlprov.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wmistr.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wmiutils.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wmsbuffer.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wmsdkidl.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wnnc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wow64apiset.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wownt16.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wownt32.h
RESOURCES191 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wpapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wpapimsg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wpcapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wpcevent.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wpcrsmsg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wpftpmsg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wppstmsg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wpspihlp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wptypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wpwizmsg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ws2atm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ws2bth.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ws2def.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ws2dnet.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ws2ipdef.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ws2spi.h
RESOURCES192 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ws2tcpip.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdattachment.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdbase.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdclient.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsddisco.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdhost.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdtypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdutil.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdxml.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdxmldom.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wshisotp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsipv6ok.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsipx.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsman.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsmandisp.h
RESOURCES193 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsnetbs.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsnwlink.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wspiapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsrm.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsvns.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wtsapi32.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wtypes.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wtypesbase.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xa.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xcmc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xcmcext.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xcmcmsx2.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xcmcmsxt.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xenroll.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xinput.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xlocinfo.h
RESOURCES194 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xmath.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xmldomdid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xmldsodid.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xmllite.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xmltrnsf.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xolehlp.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xpsdigitalsignature.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xpsobjectmodel.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xpsobjectmodel_1.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xpsprint.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xpsrassvc.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ymath.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/yvals.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/zmouse.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_bsd_types.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_cygwin.h
RESOURCES195 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_dbdao.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_dxhelper.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_mac.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_off_t.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_print_pop.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_print_push.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_secapi.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_stat64.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_stdarg.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_unicode.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_timeval.h \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/binmode.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/crt1.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/crt1u.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/crt2.o
RESOURCES196 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/crt2u.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/crtbegin.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/crtend.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/CRT_fp10.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/CRT_fp8.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/CRT_glob.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/CRT_noglob.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/dllcrt1.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/dllcrt2.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/gcrt0.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/gcrt1.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/gcrt2.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/lib6to4svc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libaaaamon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libacledit.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libaclui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libactiveds.a
RESOURCES197 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libactxprxy.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadmparse.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadmwprox.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadptif.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadrot.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadsiis.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadsiisex.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadsldp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadsldpc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadsmsext.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadsnt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadvapi32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadvpack.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libaelupsvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagentanm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagentctl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagentdp2.a
RESOURCES198 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagentdpv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagentmpx.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagentpsh.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagentsr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagrmco64.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagtintl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libakscoinst.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libalrsvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libamstream.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libapcups.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libapi-ms-win-core-winrt-l1-1-0.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libapi-ms-win-core-winrt-string-l1-1-0.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libapphelp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libappmgmts.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libappmgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libaqadmin.a
RESOURCES199 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libaqueue.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libasp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libaspperf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libasycfilt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libatkctrs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libatl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libatmlib.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libatmpvcno.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libatrace.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libaudiosrv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libauthz.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libautodisc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libavicap32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libavifil32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libavrt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libazroles.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libazroleui.a
RESOURCES200 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbasesrv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbatmeter.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbatt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbcrypt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbidispl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbitsprx2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbitsprx3.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbnts.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbootvid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbrowscap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbrowser.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbrowseui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbrpinfo.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbthci.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbthprops.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbthserv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbtpanui.a
RESOURCES201 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcabinet.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcabview.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcamocx.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcards.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcatsrv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcatsrvps.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcatsrvut.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libccfgnt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcdfview.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcdm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcdosys.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcertcli.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcertmgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcertobj.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcfgbkend.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcfgmgr32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libchsbrkr.a
RESOURCES202 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libchtbrkr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libchtskdic.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libciadmin.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcic.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcimwin32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libCINTIME.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libciodm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libclasspnp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libclb.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libclbcatex.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libclbcatq.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libclfsw32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcliconfg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libclusapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcmcfg32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcmdial32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcmpbk32.a
RESOURCES203 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcmprops.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcmsetacl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcmutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcnbjmon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcnetcfg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcnvfat.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcoadmin.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcolbact.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomaddin.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomadmin.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomcat.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomctl32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomdlg32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcompatui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcompstui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomrepl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomres.a
RESOURCES204 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomsetup.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomsnap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomsvcs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomuid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libconfmsp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libconnect.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libconsole.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcontrot.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcorpol.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcredui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcrtdll.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcrypt32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcryptdlg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcryptdll.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcryptext.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcryptnet.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcryptsp.a
RESOURCES205 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcryptsvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcryptui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcryptxml.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcscapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcscdll.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcscui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcsrsrv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libc_g18030.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libc_is2022.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libc_iscii.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd2d1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3d11.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3d8thk.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3d9.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_33.a
RESOURCES206 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_34.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_35.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_36.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_37.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_38.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_39.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_40.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_41.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_42.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_43.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_46.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcsxd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcsxd_43.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcsx_46.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_33.a
RESOURCES207 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_34.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_35.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_36.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_37.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_38.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_39.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_40.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_41.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_42.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_43.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx11.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx11_42.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx11_43.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_24.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_25.a
RESOURCES208 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_26.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_27.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_28.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_29.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_30.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_31.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_33.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_34.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_35.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_36.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_37.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_38.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_39.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_40.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_41.a
RESOURCES209 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_42.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_43.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dxof.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdanim.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdataclen.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdatime.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdavclnt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdavcprox.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdbgeng.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdbghelp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdbnetlib.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdbnmpntw.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdciman32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libddraw.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libddrawex.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdelayimp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdeskadp.a
RESOURCES210 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdeskmon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdeskperf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdevenum.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdevmgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdevobj.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdevrtl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdfrgifps.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdfrgsnap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdfrgui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdfsshlex.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdgnet.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdhcpcsvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdhcpcsvc6.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdhcpmon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdhcpsapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdiactfrm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdigest.a
RESOURCES211 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdimap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdimsntfy.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdimsroam.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdinput.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdinput8.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdirectdb.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdiskcopy.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdispex.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmconfig.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmdlgs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmdskmgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmintf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmivcitf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmocx.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmoguids.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmserver.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmutil.a
RESOURCES212 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmvdsitf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdnsapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdnsrslvr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdocprop.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdocprop2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdpnaddr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdpnet.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdpnhpast.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdpnhupnp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdpnlobby.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdpvacm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdpvoice.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdpvvox.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdrprov.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libds32gt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsauth.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsdmo.a
RESOURCES213 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsdmoprp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdskquota.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdskquoui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsound.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsound3d.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsprop.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsprov.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsquery.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdssec.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdssenh.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsuiext.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libduser.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdwmapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdwrite.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdxdiagn.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdxerr8.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdxerr9.a
RESOURCES214 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdxgi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdxguid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdxtmsft.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdxtrans.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdxva2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libeappcfg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libeappgnui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libeapphost.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libeappprxy.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libefsadu.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libels.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libencapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libersvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libes.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libesent.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libesentprf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libesscli.a
RESOURCES215 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libeventcls.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libeventlog.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libevntagnt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libevntrprv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libevr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libevtgprov.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libexstrace.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libextmgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libf3ahvoas.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfastprox.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfaultrep.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfcachdll.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfde.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfdeploy.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfeclient.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfilemgmt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfldrclnr.a
RESOURCES216 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfltlib.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfmifs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfontext.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfontsub.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libframedyn.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfsusd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libftpctrs2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libftpmib.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libftpsvc2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfwcfg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfwpuclnt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxsapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxscfgwz.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxscom.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxscomex.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxsdrv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxsmon.a
RESOURCES217 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxsocm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxsperf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxsroute.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxsst.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxst30.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxstiff.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxsui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxswzrd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgcdef.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgdi32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgdiplus.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgetuname.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libglmf32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libglu32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgmon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgpedit.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgpkcsp.a
RESOURCES218 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgptext.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libguitrn.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgzip.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libh323msp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhal.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhbaapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhgfs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhhsetup.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhidclass.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhidparse.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhlink.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhmmapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhnetcfg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhnetmon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhnetwiz.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhostmib.a
RESOURCES219 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhotplug.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhticons.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhtrn_jis.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhttpapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhttpext.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhttpmib.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhttpodbc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhtui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhypertrm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiasacct.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiasads.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiashlpr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiasnap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiaspolcy.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiasrad.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiassam.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiassdo.a
RESOURCES220 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiassvcs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicaapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicfgnt5.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicm32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicmp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicmui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicwconn.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicwdial.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicwdl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicwhelp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicwphbk.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicwutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libidq.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libieakeng.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libieaksie.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiedkcs32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libieencode.a
RESOURCES221 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiepeers.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiernonce.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiesetup.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libifmon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libifsutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libigmpagnt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiis.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisadmin.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiiscfg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisclex4.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisext.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiislog.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiismap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisrstap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisrtl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiissuba.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisui.a
RESOURCES222 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisuiobj.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisw3adm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiiswmi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimagehlp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimekrcic.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimeshare.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimgutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimjp81k.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimjpcic.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimjpcus.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimjpdct.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimjputyc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimm32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimsinsnt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimskdic.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinetcfg.a
RESOURCES223 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinetcomm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinetmgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinetmib1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinetpp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinetppui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinfoadmn.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinfocomm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinfoctrs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinfosoft.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinitpki.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinput.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinseng.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiphlpapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libipmontr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libipnathlp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libippromon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiprip.a
RESOURCES224 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiprop.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiprtprio.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiprtrmgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libipsecsnp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libipsecsvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libipsmsnap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libipv6mon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libipxsap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libirclass.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libisapips.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libisatq.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiscomlog.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiscsidsc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libisign32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libitircl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libitss.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libixsso.a
RESOURCES225 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiyuv_32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libjet500.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libjscript.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libjsproxy.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbd101.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbd101a.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbd101b.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbd101c.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbd103.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbd106.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbd106n.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbda1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbda2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbda3.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdal.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdarme.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdarmw.a
RESOURCES226 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdax2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdaze.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdazel.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdbe.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdbene.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdblr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdbr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdbu.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdca.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdcan.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdcr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdcz.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdcz1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdcz2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdda.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbddiv1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbddiv2.a
RESOURCES227 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbddv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdes.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdest.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdfa.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdfc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdfi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdfo.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdfr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdgae.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdgeo.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdgkl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdgr1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdhe.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdhe220.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdhe319.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdheb.a
RESOURCES228 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdhela2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdhela3.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdhept.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdhu.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdhu1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdibm02.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdic.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdindev.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdinguj.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdinhin.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdinkan.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdinmar.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdinpun.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdintam.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdintel.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdir.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdit.a
RESOURCES229 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdit142.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdjpn.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdkaz.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdkor.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdkyr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdla.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdlk41a.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdlk41j.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdlt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdlt1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdlv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdlv1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdmac.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdmon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdne.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdnec.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdnec95.a
RESOURCES230 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdnecat.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdnecnt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdno.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdpl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdpl1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdpo.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdro.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdru.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdru1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdsf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdsg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdsl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdsl1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdsp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdsw.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdsyr1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdsyr2.a
RESOURCES231 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdtat.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdth0.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdth1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdth2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdth3.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdtuf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdtuq.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbduk.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdur.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdurdu.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdus.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdusa.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdusl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdusr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdusx.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbduzb.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdvntc.a
RESOURCES232 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdycc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdycl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkd1394.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkdcom.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkerberos.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkernel32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkeymgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkorwbrkr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkrnlprov.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libks.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libksguid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libksuser.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libktmw32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblangwrbk.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblargeint.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblicdll.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblicmgr10.a
RESOURCES233 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblicwmi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblinkinfo.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblmhsvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblmmib2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblmrt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libloadperf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblocalsec.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblocalspl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblocalui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblog.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libloghours.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblogscrpt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblonsint.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblpdsvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblpk.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblprhelp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblprmon.a
RESOURCES234 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblprmonui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblsasrv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblz32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmag_hook.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmailmsg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmangle.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmapi32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmapistub.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmcastmib.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmcd32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmcdsrv32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmchgrcoi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmciavi32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmcicda.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmciole32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmciqtz32.a
RESOURCES235 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmciseq.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmciwave.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmdhcp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmdminst.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmetadata.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmf3216.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmfc42.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmfc42u.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmfcsubs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmfplat.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmfuuid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmgmtapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmidimap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmigism.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmiglibnt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmimefilt.a
RESOURCES236 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmingw32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmingwex.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmingwthrd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmlang.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmll_hp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmll_mtf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmll_qic.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmmcbase.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmmcndmgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmmcshext.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmmfutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmmutilse.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmobsync.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmodemui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmofd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmoldname.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmpr.a
RESOURCES237 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmprapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmprddm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmprdim.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmprmsg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmprui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqad.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqcertui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqdscli.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqgentr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqise.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqlogmgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqoa.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqperf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqqm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqrt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqrtdep.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqsec.a
RESOURCES238 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqsnap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqtrig.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqupgrd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsaatext.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsacm32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsadce.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsadcf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsadco.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsadcs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsadds.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsado15.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsadomd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsador15.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsadox.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsadrh15.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsafd.a
RESOURCES239 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsasn1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmscandui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmscat32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmscms.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsctfmonitor.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsctfp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdadiag.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdaosp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdaprst.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdaps.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdarem.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdart.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdatl3.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdfmap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdmo.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdrm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdtclog.a
RESOURCES240 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdtcprx.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdtcstp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdtctm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdtcuiu.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsftedit.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsgina.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsgr3en.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsgrocm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsgsvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmshtml.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmshtmled.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsident.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsieftp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsihnd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsimg32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsimtf.a
RESOURCES241 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsinfo.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsiprov.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsir3jp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsisip.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmslbui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsls31.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmslwvtts.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsmqocm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsobcomm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsobdl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsobmain.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsobshel.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsobweb.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsoe.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsoeacct.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsoert2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmspatcha.a
RESOURCES242 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmspmsnsv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsports.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsrating.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsrle32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmssign32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmssip32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmstask.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmstime.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmstlsapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmstscax.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsutb.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsv1_0.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvcirt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvcp60.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvcr100.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvcr110.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvcr80.a
RESOURCES243 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvcr90.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvcr90d.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvcrt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvfw32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvidc32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvidctl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsw3prt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmswsock.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsxactps.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsxml3.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsxs64.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsyuv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmtxclu.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmtxdm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmtxex.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmtxoci.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmycomput.a
RESOURCES244 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmydocs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnarrhook.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libncobjapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libncprov.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libncrypt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libncxpnt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnddeapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnddenb32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libndfapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libndis.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libndisnpp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetapi32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetcfgx.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetlogon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetman.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetoc.a
RESOURCES245 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetplwiz.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetrap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetshell.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetui0.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetui1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetui2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnewdev.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnextlink.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnlhtml.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnntpadm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnntpapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnntpsnap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnormaliz.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnpptools.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnshipsec.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntdll.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntdsapi.a
RESOURCES246 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntdsbcli.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntevt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntfsdrv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntlanman.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntlanui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntlanui2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntlsapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntmarta.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntmsapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntmsdba.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntmsevt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntmsmgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntmssvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntoc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntoskrnl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntprint.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntshrui.a
RESOURCES247 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntvdm64.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnwprovau.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboakley.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libobjsel.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboccache.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libocgen.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libocmanage.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libocmsn.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libodbc32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libodbc32gt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libodbcbcp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libodbcconf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libodbccp32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libodbccr32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libodbccu32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libodbctrac.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboeimport.a
RESOURCES248 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboemiglib.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libofffilt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libole32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboleacc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboleaut32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libolecli32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libolecnv32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboledb32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboledb32r.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboledlg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboleprn.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libolesvr32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libopengl32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libosuninst.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libovprintmondll.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libp2p.a
RESOURCES249 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libp2pcollab.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libp2pgraph.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpanmap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpautoenr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpchshell.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpchsvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpcwum.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpdh.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libperfctrs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libperfdisk.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libperfnet.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libperfos.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libperfproc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libperfts.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libphotowiz.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpidgen.a
RESOURCES250 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpintlcsa.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpintlcsd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpjlmon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpngfilt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpolicman.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpolstore.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libportabledeviceguids.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpowrprof.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libprintui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libprofmap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libprovthrd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libPS5UI.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpsapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpsbase.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpschdprf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libPSCRIPT5.a
RESOURCES251 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpsnppagn.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpstorec.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpstorsvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqasf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqcap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqdv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqdvd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqedit.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqmgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqmgrprxy.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqosname.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libquartz.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libquery.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqwave.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libracpldlg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasadhlp.a
RESOURCES252 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasapi32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasauto.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libraschap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasctrs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasdlg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasman.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasmans.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasmontr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasmxs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasppp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasrad.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librassapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasser.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librastapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librastls.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librcbdyctl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librdchost.a
RESOURCES253 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librdpcfgex.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librdpsnd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librdpwsx.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libregapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libregsvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libregwizc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libremotepg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librend.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librepdrvfs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libresutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libresutils.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libriched20.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librnr20.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libroutetab.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librpcdiag.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librpchttp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librpcns4.a
RESOURCES254 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librpcnsh.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librpcref.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librpcrt4.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librpcss.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librsaenh.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librsfsaps.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librshx32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librsmps.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librstrmgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librtm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librtutils.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libruntimeobject.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librwnh.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsafrcdlg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsafrdm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsafrslv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsamlib.a
RESOURCES255 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsamsrv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscarddlg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsccbase.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsccsccp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscecli.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscesrv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libschannel.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libschedsvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsclgntfy.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscredir.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscript.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscripto.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscriptpw.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscrnsave.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscrnsavw.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscrobj.a
RESOURCES256 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscrptutl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscrrun.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsdhcinst.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsdpblb.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libseclogon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsecur32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsecurity.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsendcmsg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsendmail.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsens.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsensapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsenscfg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsensorsapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libseo.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libseos.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libserialui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libservdeps.a
RESOURCES257 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libserwvdrv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsetupapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsetupqry.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsfc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsfcfiles.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsfc_os.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsfmapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshdocvw.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshell32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshfolder.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshgina.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshimeng.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshimgvw.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshlwapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshmedia.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshscrap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshsvcs.a
RESOURCES258 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsigtab.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsimptcp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsisbkup.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libskdll.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libslayerxp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libslbcsp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libslbiop.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libslc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libslcext.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libslwga.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsmlogcfg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsmtpadm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsmtpapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsmtpcons.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsmtpctrs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsmtpsnap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsmtpsvc.a
RESOURCES259 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsniffpol.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnmpapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnmpcl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnmpincl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnmpmib.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnmpsmir.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnmpsnap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnmpstup.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnmpthrd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnprfdll.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsoftkbd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsoftpub.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libspcommon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libspoolss.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsptip.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libspttseng.a
RESOURCES260 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsqlsrv32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsqlxmlx.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsrchctls.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsrchui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsrclient.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsrrstr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsrsvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsrvsvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libssdpapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libssdpsrv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libssinc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsspicli.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsstub.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libstaxmem.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libstclient.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libstdprov.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsti.a
RESOURCES261 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsti_ci.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libstobject.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libstorprop.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libstreamci.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libstrmfilt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libstrmiids.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsvcext.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsvcpack.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libswprv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsxs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsynceng.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsyncui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsysinv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsysmod.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsyssetup.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libt2embed.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtapi3.a
RESOURCES262 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtapi32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtapiperf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtapisrv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtbs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtcpmib.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtcpmon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtcpmonui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtdh.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtermmgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtermsrv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libthawbrkr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libthemeui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtlntsvrp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtraffic.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtrialoc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtrkwks.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtsappcmp.a
RESOURCES263 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtsbyuv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtscfgwmi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtsd32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtshoot.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtsoc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtwext.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtxflog.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtxfw32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libudhisapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libufat.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libuihelper.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libulib.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libumandlg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libumdmxfrm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libumpnpmgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libUNIDRV.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libUNIDRVUI.a
RESOURCES264 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libuniime.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libunimdmat.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libuniplat.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libuntfs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libupnp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libupnphost.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libupnpui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libureg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liburl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liburlauth.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liburlmon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libusbcamd2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libusbd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libusbmon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libusbport.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libuser32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libuserenv.a
RESOURCES265 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libusp10.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libutildll.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libuuid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libuxtheme.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvbscript.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvdsbas.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvdsdyndr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvdsutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvdswmi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvds_ps.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libverifier.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libversion.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvfw32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvgx.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libviewprov.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvmx_mode.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvssapi.a
RESOURCES266 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvsstrace.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvsswmi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvss_ps.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw32time.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw32topl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3cache.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3comlog.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3core.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3ctrlps.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3ctrs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3dt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3ext.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3isapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3ssl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3tp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwab32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwabimp.a
RESOURCES267 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwamreg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwamregps.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwbemcore.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwbemupgd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwbemuuid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdigest.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdmaud.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdsclient.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdsclientapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdscore.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdscsl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdsimage.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdstptc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdsupgcompl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdsutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwebcheck.a
RESOURCES268 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwebclnt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwebhits.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwecapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwer.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwevtapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwevtfwd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwiadss.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwiarpc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwiaservc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwiashext.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwin32spl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwindowscodecs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinfax.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinhttp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwininet.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinipsec.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinmm.a
RESOURCES269 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinrnr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinscard.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinspool.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinsrv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinsta.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwintrust.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinusb.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwkssvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwlanapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwlanui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwlanutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwldap32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwlnotify.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwlstore.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwmcodecdspuuid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwmi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwmi2xml.a
RESOURCES270 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwmiaprpl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwmilib.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwmiprop.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwmisvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwow64.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwow64cpu.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwow64mib.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwow64win.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwpd_ci.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libws2help.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libws2_32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwscsvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwsdapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwshatm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwshbth.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwshcon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwsock32.a
RESOURCES271 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwtsapi32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libx3daudio.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libx3daudio1_2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libx3daudio1_3.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libx3daudio1_4.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libx3daudio1_5.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libx3daudio1_6.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libx3daudio1_7.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libx3daudiod1_7.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxapofx.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxapofx1_0.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxapofx1_1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxapofx1_2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxapofx1_3.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxapofx1_4.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxapofx1_5.a
RESOURCES272 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxapofxd1_5.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxaudio2_8.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxinput.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxinput1_1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxinput1_2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxinput1_3.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxinput1_4.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxinput9_1_0.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libzoneoc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/txtmode.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/binmode.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/crt1.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/crt1u.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/crt2.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/crt2u.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/crtbegin.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/crtend.o
RESOURCES273 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/CRT_fp10.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/CRT_fp8.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/CRT_glob.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/CRT_noglob.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/dllcrt1.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/dllcrt2.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/gcrt0.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/gcrt1.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/gcrt2.o \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libaclui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libactiveds.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libadsldpc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libadvapi32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libapcups.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libapi-ms-win-core-winrt-l1-1-0.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libapi-ms-win-core-winrt-string-l1-1-0.a
RESOURCES274 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libauthz.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libavicap32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libavifil32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libavrt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libbcrypt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libbootvid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libbrowcli.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libbthprops.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcabinet.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcap.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcfgmgr32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libclasspnp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libclfsw32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libclusapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcmutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcomctl32.a
RESOURCES275 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcomdlg32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libconnect.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcredui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcrtdll.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcrypt32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcryptnet.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcryptsp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcryptxml.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcscapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libctl3d32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd2d1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3d11.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3d8.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3d9.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_33.a
RESOURCES276 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_34.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_35.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_36.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_37.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_38.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_39.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_40.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_41.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_42.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_43.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_46.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcsxd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcsxd_43.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcsx_46.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dim.a
RESOURCES277 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3drm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_33.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_34.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_35.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_36.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_37.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_38.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_39.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_40.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_41.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_42.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_43.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx11.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx11_42.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx11_43.a
RESOURCES278 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx8d.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9d.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_24.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_25.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_26.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_27.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_28.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_29.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_30.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_31.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_33.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_34.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_35.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_36.a
RESOURCES279 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_37.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_38.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_39.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_40.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_41.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_42.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_43.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dxof.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdavclnt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdavhlpr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdbgeng.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdbghelp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libddraw.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdelayimp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdevmgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdevobj.a
RESOURCES280 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdevrtl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdfscli.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdhcpcsvc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdhcpcsvc6.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdhcpsapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdinput.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdinput8.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdlcapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdmoguids.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdnsapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdplayx.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdpnaddr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdpnet.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdpnlobby.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdpvoice.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdsetup.a
RESOURCES281 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdsound.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdsrole.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdssec.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdwmapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdwrite.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdxapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdxerr8.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdxerr9.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdxgi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdxguid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdxva2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libeapp3hst.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libeappcfg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libeappgnui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libeapphost.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libeappprxy.a
RESOURCES282 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libelscore.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libesent.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libevr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libfaultrep.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libfwpuclnt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libgdi32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libgdiplus.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libglaux.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libglu32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libglut.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libglut32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libgmon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libgpapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libgpedit.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libgpprefcl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libgpscript.a
RESOURCES283 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libgptext.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libhal.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libhid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libhidclass.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libhidparse.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libhttpapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libicmui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libigmpagnt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libimagehlp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libimm32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libiphlpapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libiscsidsc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libkernel32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libks.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libksguid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libksproxy.a
RESOURCES284 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libksuser.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libktmw32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/liblargeint.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/liblogoncli.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/liblz32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmapi32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmcd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmfcuia32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmfplat.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmfuuid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmgmtapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmingw32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmingwex.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmingwthrd.a
RESOURCES285 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmoldname.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmpr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmprapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmqrt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsacm32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmscms.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsctf.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsctfmonitor.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsdmo.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsdrm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmshtml.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmshtmled.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsimg32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmstask.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsvcp60.a
RESOURCES286 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsvcr100.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsvcr110.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsvcr80.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsvcr90.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsvcr90d.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsvcrt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsvfw32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmswsock.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libncrypt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libnddeapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libndfapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libndis.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libnetapi32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libnetjoin.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libnetutils.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libnewdev.a
RESOURCES287 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libnormaliz.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libntdll.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libntdsapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libntmsapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libntoskrnl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libodbc32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libodbccp32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libole32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/liboleacc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/liboleaut32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libolecli32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/liboledlg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libolepro32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libolesvr32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libolethk32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libopengl32.a
RESOURCES288 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libp2p.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libp2pcollab.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libp2pgraph.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libpcwum.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libpdh.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libpdhui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libpenwin32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libpkpd32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libportabledeviceguids.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libpowrprof.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libpsapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libquartz.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libqutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libqwave.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librasapi32.a
RESOURCES289 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librasdlg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libresutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librpcdce4.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librpcdiag.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librpchttp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librpcns4.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librpcrt4.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librstrmgr.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librtm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librtutils.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libruntimeobject.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsamcli.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libschedcli.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libscrnsave.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libscrnsavw.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libscsiport.a
RESOURCES290 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsecur32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsensorsapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsetupapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libshell32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libshfolder.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libshlwapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libslc.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libslcext.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libslwga.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsnmpapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libspoolss.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsrvcli.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsspicli.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libstrmiids.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsvrapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsxs.a
RESOURCES291 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libt2embed.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libtapi32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libtbs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libtdh.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libtdi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libtxfw32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/liburl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/liburlmon.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libusbcamd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libusbcamd2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libusbd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libusbport.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libuser32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libuserenv.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libusp10.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libuuid.a
RESOURCES292 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libuxtheme.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libvdmdbg.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libversion.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libvfw32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libvideoprt.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libvirtdisk.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libvssapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libvsstrace.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libvss_ps.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwbemuuid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwdsclient.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwdsclientapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwdscore.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwdscsl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwdsimage.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwdstptc.a
RESOURCES293 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwdsupgcompl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwdsutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwecapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwer.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwevtapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwevtfwd.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwiadss.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwin32k.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwin32spl.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwindowscodecs.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwinhttp.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwininet.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwinmm.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwinscard.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwinspool.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwinstrm.a
RESOURCES294 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwintrust.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwinusb.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwkscli.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwlanapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwlanui.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwlanutil.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwldap32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwmcodecdspuuid.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwmilib.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwow32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libws2_32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwsdapi.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwsnmp32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwsock32.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwst.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwtsapi32.a
RESOURCES295 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libx3daudio.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libx3daudio1_2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libx3daudio1_3.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libx3daudio1_4.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libx3daudio1_5.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libx3daudio1_6.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libx3daudio1_7.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libx3daudiod1_7.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxapofx.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxapofx1_0.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxapofx1_1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxapofx1_2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxapofx1_3.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxapofx1_4.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxapofx1_5.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxapofxd1_5.a
RESOURCES296 = \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxaudio2_8.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxinput.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxinput1_1.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxinput1_2.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxinput1_3.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxinput1_4.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxinput9_1_0.a \
	tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/txtmode.o \
	locale/es.mo \
	locale/pt_BR.mo \
	locale/ru.mo \
	locale/zh_CN.mo \
	../extras/res/types/countryCode/es.png \
	../extras/res/types/countryCode/gb.png \
	../extras/res/types/countryCode/hu.png \
	../extras/res/types/countryCode/cn.png \
	../extras/res/types/countryCode/pt.png \
	../extras/res/types/countryCode/vn.png \
	../extras/res/types/countryCode/ru.png \
	../extras/res/types/countryCode/in.png \
	../extras/res/types/countryCode/nl.png \
	../extras/res/types/countryCode/il.png \
	../extras/res/types/countryCode/br.png \
	../ide/res/icon.png \
	ecere.png \
	ryoanji.png \
	ryoanji-progress.png

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,ecereInstaller) \
	$(call _L,ole32) \
	$(call _L,uuid) \
	$(call _L,winmm) \
	$(call _L,mpr) \
	$(call _L,z) \
	$(call _L,imm32) \
	$(call _L,png)
endif

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -Os -ffast-math) $(FPIC) -w -DREPOSITORY_VERSION="\"$(REPOSITORY_VER)\"" \
			 -DECERE_STATIC

ECFLAGS += -module $(MODULE)
CECFLAGS += -cpp $(_CPP)

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L$(call quote_path,../ecere/obj/installer.$(PLATFORM)$(ARCH_SUFFIX)) \
	 -L$(call quote_path,../deps/libpng-1.6.12/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)) \
	 -L$(call quote_path,../deps/zlib-1.2.8/obj/release.$(PLATFORM)$(COMPILER_SUFFIX))
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(call mkdir,$(OBJ))
	$(if $(ECERE_SDK_SRC),$(if $(wildcard $(call escspace,$(ECERE_SDK_SRC)/crossplatform.mk)),,@$(call echo,Ecere SDK Source Warning: The value of ECERE_SDK_SRC is pointing to an incorrect ($(ECERE_SDK_SRC)) location.)),)
	$(if $(ECERE_SDK_SRC),,$(if $(ECP_DEBUG)$(ECC_DEBUG)$(ECS_DEBUG),@$(call echo,ECC Debug Warning: Please define ECERE_SDK_SRC before using ECP_DEBUG, ECC_DEBUG or ECS_DEBUG),))

$(OBJ)$(MODULE).main.ec: $(SYMBOLS) $(COBJECTS)
	@$(call rm,$(OBJ)symbols.lst)
	@$(call touch,$(OBJ)symbols.lst)
	$(call addtolistfile,$(SYMBOLS),$(OBJ)symbols.lst)
	$(call addtolistfile,$(IMPORTS),$(OBJ)symbols.lst)
	$(ECS) $(ARCH_FLAGS) $(ECSLIBOPT) @$(OBJ)symbols.lst -symbols obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX) -o $(call quote_path,$@)

pots: $(OBJ)$(MODULE).main.ec	

$(OBJ)$(MODULE).main.c: $(OBJ)$(MODULE).main.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.sym -symbols $(OBJ)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.ec -o $(call quote_path,$@) -symbols $(OBJ)

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RCSOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
	@$(call rm,$(OBJ)objects.lst)
	@$(call touch,$(OBJ)objects.lst)
ifdef WINDOWS_TARGET
	$(call addtolistfile,$(RCOBJECTS),$(OBJ)objects.lst)
endif
	$(call addtolistfile,$(OBJ)$(MODULE).main$(O),$(OBJ)objects.lst)
	$(call addtolistfile,$(ECOBJECTS),$(OBJ)objects.lst)
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) @$(OBJ)objects.lst $(LIBS) -o $(TARGET) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
	$(EAR) aw$(EARFLAGS) $(TARGET) ../ide/res/icon.png ecere.png ryoanji.png ryoanji-progress.png ""
	$(EAR) aw$(EARFLAGS) $(TARGET) ../ecere/res/elements/areaClose.png ../ecere/res/elements/areaMaximize.png ../ecere/res/elements/areaMinimize.png ../ecere/res/elements/areaRestore.png ../ecere/res/elements/arrowDown.png ../ecere/res/elements/arrowLeft.png ../ecere/res/elements/arrowRight.png ../ecere/res/elements/arrowUp.png "ecere/elements"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../ecere/res/unicode/derivedGeneralCategoryStripped.txt "ecere/unicode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../ecere/res/actions/folderNew.png ../ecere/res/actions/goUp.png "ecere/actions"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../ecere/res/devices/computer.png ../ecere/res/devices/driveHardDisk.png ../ecere/res/devices/driveRemovableMedia.png ../ecere/res/devices/mediaFloppy.png ../ecere/res/devices/mediaOptical.png "ecere/devices"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../ecere/res/mimeTypes/file.png ../ecere/res/mimeTypes/brokenFile.png "ecere/mimetypes"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../ecere/res/places/driveRemote.png ../ecere/res/places/folder.png ../ecere/res/places/folderRemote.png ../ecere/res/places/networkServer.png ../ecere/res/places/networkWorkgroup.png ../ecere/res/places/brokenFolder.png "ecere/places"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../ecere/res/status/folderOpen.png "ecere/status"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../ecere/locale/es.mo ../ecere/locale/hu.mo ../ecere/locale/mr.mo ../ecere/locale/nl.mo ../ecere/locale/pt_BR.mo ../ecere/locale/ru.mo ../ecere/locale/zh_CN.mo "ecere/locale"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../obj/win32/bin/ecere.dll ../obj/win32/lib/libecereVanilla.a ../obj/win32/bin/EcereAudio.dll "ecere-sdk"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../obj/win32/bin/documentor.exe ../obj/win32/bin/ecere-ide.exe "ecere-sdk/ide"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../obj/win32/bin/ear.exe ../obj/win32/bin/ec.dll ../obj/win32/bin/ecc.exe ../obj/win32/bin/ecereCOM.dll ../obj/win32/bin/ecp.exe ../obj/win32/bin/ecs.exe ../obj/win32/bin/epj2make.exe "ecere-sdk/compiler"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../obj/win32/bin/EDA.dll ../obj/win32/bin/EDASQLite.dll "ecere-sdk/eda"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../LICENSE ../README.md ../doc/tao.pdf "ecere-sdk/doc"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/unichar.econ ../doc/ecere/_global-defs.econ "ecere-sdk/doc/ecere"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/_global-defs.econ "ecere-sdk/doc/ecere/ecere"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/com/AccessMode.econ ../doc/ecere/ecere/com/Angle.econ ../doc/ecere/ecere/com/Array.econ ../doc/ecere/ecere/com/AVLNode.econ ../doc/ecere/ecere/com/AVLTree.econ ../doc/ecere/ecere/com/BitMember.econ ../doc/ecere/ecere/com/BTNamedLink.econ ../doc/ecere/ecere/com/BuiltInContainer.econ ../doc/ecere/ecere/com/Class.econ ../doc/ecere/ecere/com/ClassDesignerBase.econ "ecere-sdk/doc/ecere/ecere/com"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/com/ClassProperty.econ ../doc/ecere/ecere/com/ClassTemplateArgument.econ ../doc/ecere/ecere/com/ClassTemplateParameter.econ ../doc/ecere/ecere/com/ClassType.econ ../doc/ecere/ecere/com/Container.econ ../doc/ecere/ecere/com/CustomAVLTree.econ ../doc/ecere/ecere/com/DataMember.econ ../doc/ecere/ecere/com/DataMemberType.econ ../doc/ecere/ecere/com/DataValue.econ ../doc/ecere/ecere/com/DefinedExpression.econ "ecere-sdk/doc/ecere/ecere/com"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/com/DesignerBase.econ ../doc/ecere/ecere/com/EnumClassData.econ ../doc/ecere/ecere/com/GlobalFunction.econ ../doc/ecere/ecere/com/ImportType.econ ../doc/ecere/ecere/com/IOChannel.econ ../doc/ecere/ecere/com/Iterator.econ ../doc/ecere/ecere/com/IteratorPointer.econ ../doc/ecere/ecere/com/Link.econ ../doc/ecere/ecere/com/LinkElement.econ ../doc/ecere/ecere/com/LinkList.econ "ecere-sdk/doc/ecere/ecere/com"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/com/List.econ ../doc/ecere/ecere/com/ListItem.econ ../doc/ecere/ecere/com/Map.econ ../doc/ecere/ecere/com/MapIterator.econ ../doc/ecere/ecere/com/MapNode.econ ../doc/ecere/ecere/com/Method.econ ../doc/ecere/ecere/com/MethodType.econ ../doc/ecere/ecere/com/NameSpace.econ ../doc/ecere/ecere/com/ObjectInfo.econ ../doc/ecere/ecere/com/Platform.econ "ecere-sdk/doc/ecere/ecere/com"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/com/Property.econ ../doc/ecere/ecere/com/SerialBuffer.econ ../doc/ecere/ecere/com/StaticString.econ ../doc/ecere/ecere/com/SubModule.econ ../doc/ecere/ecere/com/TemplateMemberType.econ ../doc/ecere/ecere/com/TemplateParameterType.econ ../doc/ecere/ecere/com/_global-defs.econ "ecere-sdk/doc/ecere/ecere/com"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/gfx/Bitmap.econ ../doc/ecere/ecere/gfx/BitmapResource.econ ../doc/ecere/ecere/gfx/Color.econ ../doc/ecere/ecere/gfx/Color444.econ ../doc/ecere/ecere/gfx/Color555.econ ../doc/ecere/ecere/gfx/Color565.econ ../doc/ecere/ecere/gfx/ColorAlpha.econ ../doc/ecere/ecere/gfx/ColorCMYK.econ ../doc/ecere/ecere/gfx/ColorHSV.econ ../doc/ecere/ecere/gfx/ColorKey.econ "ecere-sdk/doc/ecere/ecere/gfx"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/gfx/ColorLab.econ ../doc/ecere/ecere/gfx/ColorRGB.econ ../doc/ecere/ecere/gfx/ColorRGBA.econ ../doc/ecere/ecere/gfx/ColorRGBAf.econ ../doc/ecere/ecere/gfx/CubeMap.econ ../doc/ecere/ecere/gfx/DefinedColor.econ ../doc/ecere/ecere/gfx/Display.econ ../doc/ecere/ecere/gfx/DisplayDriver.econ ../doc/ecere/ecere/gfx/DisplaySystem.econ ../doc/ecere/ecere/gfx/Font.econ "ecere-sdk/doc/ecere/ecere/gfx"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/gfx/FontResource.econ ../doc/ecere/ecere/gfx/Resource.econ ../doc/ecere/ecere/gfx/Surface.econ ../doc/ecere/ecere/gfx/_global-defs.econ "ecere-sdk/doc/ecere/ecere/gfx"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/gfx/drivers/Font.econ ../doc/ecere/ecere/gfx/drivers/_global-defs.econ "ecere-sdk/doc/ecere/ecere/gfx/drivers"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/gfx3D/_global-defs.econ "ecere-sdk/doc/ecere/ecere/gfx3D"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/gfx3D/meshes/_global-defs.econ "ecere-sdk/doc/ecere/ecere/gfx3D/meshes"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/gui/Anchor.econ ../doc/ecere/ecere/gui/BorderStyle.econ ../doc/ecere/ecere/gui/Key.econ ../doc/ecere/ecere/gui/KeyCode.econ ../doc/ecere/ecere/gui/Percentage.econ ../doc/ecere/ecere/gui/PredefinedKey.econ ../doc/ecere/ecere/gui/Timer.econ ../doc/ecere/ecere/gui/Window.econ ../doc/ecere/ecere/gui/_global-defs.econ "ecere-sdk/doc/ecere/ecere/gui"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/gui/controls/BufferLocation.econ ../doc/ecere/ecere/gui/controls/DropBox.econ ../doc/ecere/ecere/gui/controls/EditBox.econ ../doc/ecere/ecere/gui/controls/Label.econ ../doc/ecere/ecere/gui/controls/_global-defs.econ "ecere-sdk/doc/ecere/ecere/gui/controls"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/gui/dialogs/_global-defs.econ "ecere-sdk/doc/ecere/ecere/gui/dialogs"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/gui/skins/_global-defs.econ "ecere-sdk/doc/ecere/ecere/gui/skins"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/net/DCOMClientObject.econ ../doc/ecere/ecere/net/DCOMServerObject.econ ../doc/ecere/ecere/net/DCOMServerSocket.econ ../doc/ecere/ecere/net/DCOMService.econ ../doc/ecere/ecere/net/FileServerConnection.econ ../doc/ecere/ecere/net/HTTPFile.econ ../doc/ecere/ecere/net/NetworkClientFile.econ ../doc/ecere/ecere/net/Packet.econ ../doc/ecere/ecere/net/Service.econ ../doc/ecere/ecere/net/Socket.econ "ecere-sdk/doc/ecere/ecere/net"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/net/SSLSocket.econ ../doc/ecere/ecere/net/_global-defs.econ "ecere-sdk/doc/ecere/ecere/net"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecere/ecere/sys/File.econ ../doc/ecere/ecere/sys/FileListing.econ ../doc/ecere/ecere/sys/NamedLink64.econ ../doc/ecere/ecere/sys/Point.econ ../doc/ecere/ecere/sys/Pointf.econ ../doc/ecere/ecere/sys/_global-defs.econ "ecere-sdk/doc/ecere/ecere/sys"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecereCOM/bool.econ ../doc/ecereCOM/byte.econ ../doc/ecereCOM/char-pointer.econ ../doc/ecereCOM/char.econ ../doc/ecereCOM/class.econ ../doc/ecereCOM/double.econ ../doc/ecereCOM/enum.econ ../doc/ecereCOM/float.econ ../doc/ecereCOM/int.econ ../doc/ecereCOM/int64.econ "ecere-sdk/doc/ecereCOM"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecereCOM/intptr.econ ../doc/ecereCOM/intsize.econ ../doc/ecereCOM/short.econ ../doc/ecereCOM/String.econ ../doc/ecereCOM/struct.econ ../doc/ecereCOM/uint.econ ../doc/ecereCOM/uint16.econ ../doc/ecereCOM/uint32.econ ../doc/ecereCOM/uint64.econ ../doc/ecereCOM/uintptr.econ "ecere-sdk/doc/ecereCOM"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecereCOM/uintsize.econ ../doc/ecereCOM/unsigned-int.econ ../doc/ecereCOM/_global-defs.econ "ecere-sdk/doc/ecereCOM"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecereCOM/ecere/_global-defs.econ "ecere-sdk/doc/ecereCOM/ecere"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecereCOM/ecere/com/Application.econ ../doc/ecereCOM/ecere/com/Instance.econ ../doc/ecereCOM/ecere/com/Module.econ ../doc/ecereCOM/ecere/com/_global-defs.econ "ecere-sdk/doc/ecereCOM/ecere/com"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/ecereCOM/ecere/sys/_global-defs.econ "ecere-sdk/doc/ecereCOM/ecere/sys"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/EDA/eda/MoveOptions.econ ../doc/EDA/eda/_global-defs.econ "ecere-sdk/doc/EDA/eda"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../share/man/man1/documentor.1 ../share/man/man1/ear.1 ../share/man/man1/ecc.1 ../share/man/man1/ecere-ide.1 ../share/man/man1/ecp.1 ../share/man/man1/ecs.1 ../share/man/man1/epj2make.1 "ecere-sdk/doc/man/man1"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../doc/tao.pdf "ecere-sdk/book"
	$(EAR) aw$(EARFLAGS) $(TARGET) coursework/Chapter\ 1\ -\ Getting\ Started/answers\ -\ chapter\ 1.odt coursework/Chapter\ 1\ -\ Getting\ Started/exercises\ -\ chapter\ 1.odt "ecere-sdk/coursework/Chapter 1 - Getting Started"
	$(EAR) aw$(EARFLAGS) $(TARGET) coursework/Chapter\ 1\ -\ Getting\ Started/Lab1.1/helloWorld.ec coursework/Chapter\ 1\ -\ Getting\ Started/Lab1.1/HelloWorld.epj "ecere-sdk/coursework/Chapter 1 - Getting Started/Lab1.1"
	$(EAR) aw$(EARFLAGS) $(TARGET) coursework/Chapter\ 1\ -\ Getting\ Started/Lab1.2/form1.ec coursework/Chapter\ 1\ -\ Getting\ Started/Lab1.2/HelloForm.epj "ecere-sdk/coursework/Chapter 1 - Getting Started/Lab1.2"
	$(EAR) aw$(EARFLAGS) $(TARGET) coursework/Chapter\ 2\ -\ Variables\ and\ Data\ Types/answers\ -\ chapter\ 2.odt coursework/Chapter\ 2\ -\ Variables\ and\ Data\ Types/exercises\ -\ chapter\ 2.odt "ecere-sdk/coursework/Chapter 2 - Variables and Data Types"
	$(EAR) aw$(EARFLAGS) $(TARGET) coursework/Chapter\ 2\ -\ Variables\ and\ Data\ Types/Lab2.4/lab2.ec coursework/Chapter\ 2\ -\ Variables\ and\ Data\ Types/Lab2.4/Lab2.epj "ecere-sdk/coursework/Chapter 2 - Variables and Data Types/Lab2.4"
	$(EAR) aw$(EARFLAGS) $(TARGET) coursework/Chapter\ 2\ -\ Variables\ and\ Data\ Types/Lab2.5/variables.ec coursework/Chapter\ 2\ -\ Variables\ and\ Data\ Types/Lab2.5/VariablesApp.epj "ecere-sdk/coursework/Chapter 2 - Variables and Data Types/Lab2.5"
	$(EAR) aw$(EARFLAGS) $(TARGET) coursework/Chapter\ 3\ -\ Operators/answers\ -\ chapter\ 3.odt coursework/Chapter\ 3\ -\ Operators/exercises\ -\ chapter\ 3.odt "ecere-sdk/coursework/Chapter 3 - Operators"
	$(EAR) aw$(EARFLAGS) $(TARGET) coursework/Chapter\ 3\ -\ Operators/Lab3/lab3.ec coursework/Chapter\ 3\ -\ Operators/Lab3/Lab3.epj "ecere-sdk/coursework/Chapter 3 - Operators/Lab3"
	$(EAR) aw$(EARFLAGS) $(TARGET) coursework/Chapter\ 4\ -\ Flow\ Control/answers\ -\ chapter\ 4.odt coursework/Chapter\ 4\ -\ Flow\ Control/exercises\ -\ chapter\ 4.odt "ecere-sdk/coursework/Chapter 4 - Flow Control"
	$(EAR) aw$(EARFLAGS) $(TARGET) coursework/Chapter\ 4\ -\ Flow\ Control/Lab4/lab4.ec coursework/Chapter\ 4\ -\ Flow\ Control/Lab4/Lab4.epj "ecere-sdk/coursework/Chapter 4 - Flow Control/Lab4"
	$(EAR) aw$(EARFLAGS) $(TARGET) coursework/Chapter\ 5\ -\ Structures\ and\ Enumerations/answers\ -\ chapter\ 5.odt coursework/Chapter\ 5\ -\ Structures\ and\ Enumerations/exercises\ -\ chapter\ 5.odt "ecere-sdk/coursework/Chapter 5 - Structures and Enumerations"
	$(EAR) aw$(EARFLAGS) $(TARGET) coursework/Chapter\ 5\ -\ Structures\ and\ Enumerations/Lab5/colors/lab5colors.ec coursework/Chapter\ 5\ -\ Structures\ and\ Enumerations/Lab5/colors/lab5colors.epj "ecere-sdk/coursework/Chapter 5 - Structures and Enumerations/Lab5/colors"
	$(EAR) aw$(EARFLAGS) $(TARGET) coursework/Chapter\ 5\ -\ Structures\ and\ Enumerations/Lab5/vectors/lab5vectors.ec coursework/Chapter\ 5\ -\ Structures\ and\ Enumerations/Lab5/vectors/lab5vectors.epj "ecere-sdk/coursework/Chapter 5 - Structures and Enumerations/Lab5/vectors"
	$(EAR) aw$(EARFLAGS) $(TARGET) coursework/Chapter\ 6\ -\ Classes,\ Methods\ and\ Instances/answers\ -\ chapter\ 6.odt coursework/Chapter\ 6\ -\ Classes,\ Methods\ and\ Instances/exercises\ -\ chapter\ 6.odt "ecere-sdk/coursework/Chapter 6 - Classes, Methods and Instances"
	$(EAR) aw$(EARFLAGS) $(TARGET) coursework/Chapter\ 6\ -\ Classes,\ Methods\ and\ Instances/Lab6/lab6.ec coursework/Chapter\ 6\ -\ Classes,\ Methods\ and\ Instances/Lab6/lab6.epj "ecere-sdk/coursework/Chapter 6 - Classes, Methods and Instances/Lab6"
	$(EAR) aw$(EARFLAGS) $(TARGET) upx391w/upx.exe "upx/bin"
	$(EAR) aw$(EARFLAGS) $(TARGET) upx391w/BUGS upx391w/COPYING upx391w/LICENSE upx391w/NEWS upx391w/README upx391w/README.1ST upx391w/THANKS upx391w/TODO upx391w/upx.1 upx391w/upx.doc "upx/doc"
	$(EAR) aw$(EARFLAGS) $(TARGET) upx391w/upx.html "upx/doc"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/LICENSE "samples"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/Animate3DS/Animate3DS.ec ../samples/3D/Animate3DS/Animate3DS.epj "samples/3D/Animate3DS"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/Animate3DS/res/desktop.3ds ../samples/3D/Animate3DS/res/floor.jpg ../samples/3D/Animate3DS/res/wall_80.jpg "samples/3D/Animate3DS/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/ColorSpheres/colorSpheres.ec ../samples/3D/ColorSpheres/colorSpheres.epj "samples/3D/ColorSpheres"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/cube2/cube2.ec ../samples/3D/cube2/cube2.epj ../samples/3D/cube2/knot.png ../samples/3D/cube2/fractal3.jpg "samples/3D/cube2"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/glTriangle/glTriangle.ec ../samples/3D/glTriangle/glTriangle.epj "samples/3D/glTriangle"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/hello3D/hello3D.ec ../samples/3D/hello3D/hello3D.epj "samples/3D/hello3D"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/HiraganaCube/FreeSans.ttf ../samples/3D/HiraganaCube/hiraganaCube.ec ../samples/3D/HiraganaCube/HiraganaCube.epj "samples/3D/HiraganaCube"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/ModelViewer/eModel.ec ../samples/3D/ModelViewer/eModel.epj ../samples/3D/ModelViewer/engineSettings.ec "samples/3D/ModelViewer"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/ModelViewer/res/ecere.png ../samples/3D/ModelViewer/res/help.txt "samples/3D/ModelViewer/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/ModelViewer/models/teapot.3DS "samples/3D/ModelViewer/models"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/ModelViewer/models/barn/barn.3DS ../samples/3D/ModelViewer/models/barn/Batten.jpg ../samples/3D/ModelViewer/models/barn/Boardbmp.jpg ../samples/3D/ModelViewer/models/barn/Boards.jpg ../samples/3D/ModelViewer/models/barn/Boards1.jpg ../samples/3D/ModelViewer/models/barn/Concrete.jpg ../samples/3D/ModelViewer/models/barn/cutout.jpg ../samples/3D/ModelViewer/models/barn/Finish.jpg ../samples/3D/ModelViewer/models/barn/FlWood.jpg ../samples/3D/ModelViewer/models/barn/Horizont.jpg "samples/3D/ModelViewer/models/barn"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/ModelViewer/models/barn/OLDWOOD.jpg ../samples/3D/ModelViewer/models/barn/Read\ me_Old\ Barn.txt ../samples/3D/ModelViewer/models/barn/SANDSHOR.JPG ../samples/3D/ModelViewer/models/barn/Shadow.jpg ../samples/3D/ModelViewer/models/barn/STEELPLT.JPG ../samples/3D/ModelViewer/models/barn/Trellis.jpg ../samples/3D/ModelViewer/models/barn/Wood1.jpg "samples/3D/ModelViewer/models/barn"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/ModelViewer/models/cart/Barrel.JPG ../samples/3D/ModelViewer/models/cart/cart.3DS ../samples/3D/ModelViewer/models/cart/Cart1.jpg ../samples/3D/ModelViewer/models/cart/Cart2.jpg ../samples/3D/ModelViewer/models/cart/Cart3.jpg ../samples/3D/ModelViewer/models/cart/metal_F.jpg ../samples/3D/ModelViewer/models/cart/MetCart1.jpg ../samples/3D/ModelViewer/models/cart/MetCart2.jpg ../samples/3D/ModelViewer/models/cart/OLDWOOD.JPG ../samples/3D/ModelViewer/models/cart/Read\ me_Cart\ For\ the\ Barn.txt "samples/3D/ModelViewer/models/cart"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/ModelViewer/models/cart/WoodBr.jpg "samples/3D/ModelViewer/models/cart"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/ModelViewer/models/cow/cow.3DS ../samples/3D/ModelViewer/models/cow/spot_tex.png "samples/3D/ModelViewer/models/cow"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/ModelViewer/models/duck/duck.3DS ../samples/3D/ModelViewer/models/duck/duck.png "samples/3D/ModelViewer/models/duck"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/ModelViewer/models/house/bordo.jpg ../samples/3D/ModelViewer/models/house/cement.jpg ../samples/3D/ModelViewer/models/house/CUT2WV.JPG ../samples/3D/ModelViewer/models/house/CUTWV.JPG ../samples/3D/ModelViewer/models/house/fence.JPG ../samples/3D/ModelViewer/models/house/Hardwood.jpg ../samples/3D/ModelViewer/models/house/house.3DS ../samples/3D/ModelViewer/models/house/latB.jpg ../samples/3D/ModelViewer/models/house/lati.jpg ../samples/3D/ModelViewer/models/house/latiA.jpg "samples/3D/ModelViewer/models/house"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/ModelViewer/models/house/OLDWOOD.JPG ../samples/3D/ModelViewer/models/house/pezzomur.jpg ../samples/3D/ModelViewer/models/house/Read\ me_House.txt ../samples/3D/ModelViewer/models/house/Tetto1.jpg "samples/3D/ModelViewer/models/house"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/ModelViewer/models/katanakake/Katanakake.3DS ../samples/3D/ModelViewer/models/katanakake/Wood_t~1.jpg "samples/3D/ModelViewer/models/katanakake"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/ModelViewer/models/table/aluminiu.jpg ../samples/3D/ModelViewer/models/table/pine_4.JPG ../samples/3D/ModelViewer/models/table/Read\ me_Set\ LunchRoom.txt ../samples/3D/ModelViewer/models/table/table.3DS "samples/3D/ModelViewer/models/table"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/ModelViewer/skycube/bk.jpg ../samples/3D/ModelViewer/skycube/dn.jpg ../samples/3D/ModelViewer/skycube/fr.jpg ../samples/3D/ModelViewer/skycube/lf.jpg ../samples/3D/ModelViewer/skycube/rt.jpg ../samples/3D/ModelViewer/skycube/up.jpg "samples/3D/ModelViewer/skycube"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/OpenGL/glEcereCamera.ec ../samples/3D/OpenGL/glSnippet.ec ../samples/3D/OpenGL/OpenGL.epj "samples/3D/OpenGL"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/orbitWithMouse/orbitWithMouse.ec ../samples/3D/orbitWithMouse/orbitWithMouse.epj "samples/3D/orbitWithMouse"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/orbitWithMouse/res/icon1.png ../samples/3D/orbitWithMouse/res/icon10.png ../samples/3D/orbitWithMouse/res/icon2.png ../samples/3D/orbitWithMouse/res/icon3.png ../samples/3D/orbitWithMouse/res/icon4.png ../samples/3D/orbitWithMouse/res/icon5.png ../samples/3D/orbitWithMouse/res/icon6.png ../samples/3D/orbitWithMouse/res/icon7.png ../samples/3D/orbitWithMouse/res/icon8.png ../samples/3D/orbitWithMouse/res/icon9.png "samples/3D/orbitWithMouse/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/orbitWithMouse/res/img1.jpg ../samples/3D/orbitWithMouse/res/img2.jpg ../samples/3D/orbitWithMouse/res/img3.jpg ../samples/3D/orbitWithMouse/res/img4.jpg ../samples/3D/orbitWithMouse/res/img5.jpg "samples/3D/orbitWithMouse/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/rayTracedMandelbulb/mandelbulb.ec ../samples/3D/rayTracedMandelbulb/mandelbulb.epj "samples/3D/rayTracedMandelbulb"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/spriteBalls/balls.ec ../samples/3D/spriteBalls/balls.epj "samples/3D/spriteBalls"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/terrainCameraDemo/cameraDemo.epj ../samples/3D/terrainCameraDemo/demo.ec ../samples/3D/terrainCameraDemo/dna.ec ../samples/3D/terrainCameraDemo/terrain.ec "samples/3D/terrainCameraDemo"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/terrainCameraDemo/res/N45W110.hgt ../samples/3D/terrainCameraDemo/res/texture.png ../samples/3D/terrainCameraDemo/res/texture1.pcx "samples/3D/terrainCameraDemo/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/terrainCameraDemo/res/aircraft/06\ 17\ 09.png ../samples/3D/terrainCameraDemo/res/aircraft/aircraft.3DS "samples/3D/terrainCameraDemo/res/aircraft"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/Test3D/Test3D.ec ../samples/3D/Test3D/Test3D.epj "samples/3D/Test3D"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/TransCube/glass.bmp ../samples/3D/TransCube/tex1.bmp ../samples/3D/TransCube/tex2.bmp ../samples/3D/TransCube/tex3.bmp ../samples/3D/TransCube/tex4.bmp ../samples/3D/TransCube/tex5.bmp ../samples/3D/TransCube/tex6.bmp ../samples/3D/TransCube/tex7.bmp ../samples/3D/TransCube/tex8.bmp ../samples/3D/TransCube/transCube.ec "samples/3D/TransCube"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/TransCube/transCube.epj "samples/3D/TransCube"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/VertexColorTest/VertexColorTest.ec ../samples/3D/VertexColorTest/VertexColorTest.epj "samples/3D/VertexColorTest"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/walkAround/walkAround.ec ../samples/3D/walkAround/walkAround.epj "samples/3D/walkAround"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/3D/materials/materials.ec ../samples/3D/materials/materials.epj ../samples/3D/materials/normal.jpg ../samples/3D/materials/teapot.3DS "samples/3D/materials"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/audio/Ecere\ Audio\ Library.odp "samples/audio"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/audio/DirectBufferPlayer/wavPlayer.ec ../samples/audio/DirectBufferPlayer/WavPlayer.epj ../samples/audio/DirectBufferPlayer/sweep.wav "samples/audio/DirectBufferPlayer"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/audio/Piano/Piano.ec ../samples/audio/Piano/Piano.epj ../samples/audio/Piano/cello.wav ../samples/audio/Piano/piano.wav ../samples/audio/Piano/tone.wav ../samples/audio/Piano/xylophone.wav "samples/audio/Piano"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/audio/PlaySound/PlaySound.ec ../samples/audio/PlaySound/PlaySound.epj ../samples/audio/PlaySound/sound.wav "samples/audio/PlaySound"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/audio/S3MPlayer/keven1.s3m "samples/audio/S3MPlayer"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/audio/SineTone/sineTone.ec ../samples/audio/SineTone/sineTone.epj "samples/audio/SineTone"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/db/eda\ presentation.odp "samples/db"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/db/EDATest/EDATest.ec ../samples/db/EDATest/EDATest.epj "samples/db/EDATest"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/db/MedDB/mainForm.ec ../samples/db/MedDB/med.ec ../samples/db/MedDB/med.edb ../samples/db/MedDB/med.epj "samples/db/MedDB"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/db/MovieCollection/allMoviesReport.ec ../samples/db/MovieCollection/borrowerReport.ec ../samples/db/MovieCollection/movieCollection.ec ../samples/db/MovieCollection/MovieCollection.epj ../samples/db/MovieCollection/movieSchema.ec ../samples/db/MovieCollection/reports.ec ../samples/db/MovieCollection/collection.sqlite "samples/db/MovieCollection"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/eC/ampheck/ampheck.epj ../samples/eC/ampheck/main.ec "samples/eC/ampheck"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/eC/ecas/ecas.ec ../samples/eC/ecas/ecas.epj ../samples/eC/ecas/expression.ec ../samples/eC/ecas/misc.ec "samples/eC/ecas"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/eC/fibonacci/fibo.ec ../samples/eC/fibonacci/fibo.epj "samples/eC/fibonacci"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/eC/FindPrime/findPrime.ec ../samples/eC/FindPrime/PrimeTest.epj "samples/eC/FindPrime"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/eC/HelloWorld/HelloWorld.ec ../samples/eC/HelloWorld/HelloWorld.epj "samples/eC/HelloWorld"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/eC/neural/neural.ec ../samples/eC/neural/neural.epj ../samples/eC/neural/neurons.ec "samples/eC/neural"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/eC/staticLink/staticLink.ec ../samples/eC/staticLink/staticLink.epj "samples/eC/staticLink"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/cornerBlocks/cornerBlocks.ec ../samples/games/cornerBlocks/cornerBlocks.epj ../samples/games/cornerBlocks/CornerBlocksServer.ec "samples/games/cornerBlocks"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/bomb/bomb.ec ../samples/games/bomb/bomb.epj "samples/games/bomb"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/bomb/res/3.pcx ../samples/games/bomb/res/block.pcx ../samples/games/bomb/res/bomb.pcx ../samples/games/bomb/res/deacbomb.pcx ../samples/games/bomb/res/deadeac.pcx ../samples/games/bomb/res/desactiv.pcx ../samples/games/bomb/res/map1.dat ../samples/games/bomb/res/map10.dat ../samples/games/bomb/res/map11.dat ../samples/games/bomb/res/map2.dat "samples/games/bomb/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/bomb/res/map3.dat ../samples/games/bomb/res/map4.dat ../samples/games/bomb/res/map5.dat ../samples/games/bomb/res/map6.dat ../samples/games/bomb/res/map7.dat ../samples/games/bomb/res/map8.dat ../samples/games/bomb/res/map9.dat ../samples/games/bomb/res/max3.pcx ../samples/games/bomb/res/nothing.pcx ../samples/games/bomb/res/password.pcx "samples/games/bomb/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/bomb/res/player.pcx "samples/games/bomb/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/stonePairs/Building\ a\ simple\ board\ game\ with\ the\ Ecere\ SDK.odp ../samples/games/stonePairs/game.ec ../samples/games/stonePairs/stonePairs.ec ../samples/games/stonePairs/stonePairs.epj "samples/games/stonePairs"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/stonePairs/res/remove.png ../samples/games/stonePairs/res/arrow.png ../samples/games/stonePairs/res/black.png ../samples/games/stonePairs/res/blackGray.png ../samples/games/stonePairs/res/board.jpg ../samples/games/stonePairs/res/white.png ../samples/games/stonePairs/res/whiteGray.png "samples/games/stonePairs/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/cards/poker/bet.ec ../samples/games/cards/poker/player.ec ../samples/games/cards/poker/poker.ec ../samples/games/cards/poker/poker.epj ../samples/games/cards/poker/pokerutils.ec ../samples/games/cards/poker/widow.ec "samples/games/cards/poker"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/cards/res/10c.png ../samples/games/cards/res/10d.png ../samples/games/cards/res/10h.png ../samples/games/cards/res/10s.png ../samples/games/cards/res/2c.png ../samples/games/cards/res/2d.png ../samples/games/cards/res/2h.png ../samples/games/cards/res/2s.png ../samples/games/cards/res/3c.png ../samples/games/cards/res/3d.png "samples/games/cards/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/cards/res/3h.png ../samples/games/cards/res/3s.png ../samples/games/cards/res/4c.png ../samples/games/cards/res/4d.png ../samples/games/cards/res/4h.png ../samples/games/cards/res/4s.png ../samples/games/cards/res/5c.png ../samples/games/cards/res/5d.png ../samples/games/cards/res/5h.png ../samples/games/cards/res/5s.png "samples/games/cards/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/cards/res/6c.png ../samples/games/cards/res/6d.png ../samples/games/cards/res/6h.png ../samples/games/cards/res/6s.png ../samples/games/cards/res/7c.png ../samples/games/cards/res/7d.png ../samples/games/cards/res/7h.png ../samples/games/cards/res/7s.png ../samples/games/cards/res/8c.png ../samples/games/cards/res/8d.png "samples/games/cards/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/cards/res/8h.png ../samples/games/cards/res/8s.png ../samples/games/cards/res/9c.png ../samples/games/cards/res/9d.png ../samples/games/cards/res/9h.png ../samples/games/cards/res/9s.png ../samples/games/cards/res/ac.png ../samples/games/cards/res/ad.png ../samples/games/cards/res/ah.png ../samples/games/cards/res/as.png "samples/games/cards/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/cards/res/back.png ../samples/games/cards/res/clubs.png ../samples/games/cards/res/diamonds.png ../samples/games/cards/res/hearts.png ../samples/games/cards/res/jc.png ../samples/games/cards/res/jd.png ../samples/games/cards/res/jh.png ../samples/games/cards/res/js.png ../samples/games/cards/res/kc.png ../samples/games/cards/res/kd.png "samples/games/cards/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/cards/res/kh.png ../samples/games/cards/res/ks.png ../samples/games/cards/res/qc.png ../samples/games/cards/res/qd.png ../samples/games/cards/res/qh.png ../samples/games/cards/res/qs.png ../samples/games/cards/res/rb.png ../samples/games/cards/res/rr.png ../samples/games/cards/res/spades.png "samples/games/cards/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/cards/ruff/ruff.epj "samples/games/cards/ruff"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/cards/ruff/src/ai.ec ../samples/games/cards/ruff/src/bet.ec ../samples/games/cards/ruff/src/communication.ec ../samples/games/cards/ruff/src/ruff.ec ../samples/games/cards/ruff/src/scores.ec ../samples/games/cards/ruff/src/server.ec ../samples/games/cards/ruff/src/setup.ec ../samples/games/cards/ruff/src/trump.ec "samples/games/cards/ruff/src"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/cards/tongIts/tongits.ec ../samples/games/cards/tongIts/tongIts.epj "samples/games/cards/tongIts"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/othello/othello.ec ../samples/games/othello/Othello.epj "samples/games/othello"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/othello/res/blue.bmp ../samples/games/othello/res/green.bmp ../samples/games/othello/res/othello.bmp "samples/games/othello/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/crosswords/crossWords.ec ../samples/games/crosswords/crossWords.epj ../samples/games/crosswords/CrossWordsServer.ec "samples/games/crosswords"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/crosswords/res/englishWords.txt ../samples/games/crosswords/res/frenchWords.txt "samples/games/crosswords/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/tetrominoes/tetrominoes.ec ../samples/games/tetrominoes/tetrominoes.epj "samples/games/tetrominoes"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/tetrominoes/res/tetrominoes.png "samples/games/tetrominoes/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/ticTacToe/SDKIntro.pdf ../samples/games/ticTacToe/TicTacToe.ec ../samples/games/ticTacToe/TicTacToe.epj "samples/games/ticTacToe"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/chess/chess.epj "samples/games/chess"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/chess/res/aboutPic.jpg ../samples/games/chess/res/blackBishop.png ../samples/games/chess/res/blackKing.png ../samples/games/chess/res/blackKnight.png ../samples/games/chess/res/blackPawn.png ../samples/games/chess/res/blackQueen.png ../samples/games/chess/res/blackRook.png ../samples/games/chess/res/board.jpg ../samples/games/chess/res/bthr.jpg ../samples/games/chess/res/chessSet.3ds "samples/games/chess/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/chess/res/darkwood.jpg ../samples/games/chess/res/lightwo1.jpg ../samples/games/chess/res/whiteBishop.png ../samples/games/chess/res/whiteKing.png ../samples/games/chess/res/whiteKnight.png ../samples/games/chess/res/whitePawn.png ../samples/games/chess/res/whiteQueen.png ../samples/games/chess/res/whiteRook.png "samples/games/chess/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/games/chess/src/about.ec ../samples/games/chess/src/ai.ec ../samples/games/chess/src/chess.ec ../samples/games/chess/src/chess2D.ec ../samples/games/chess/src/chess3D.ec ../samples/games/chess/src/chessutils.ec ../samples/games/chess/src/connect.ec ../samples/games/chess/src/promotion.ec "samples/games/chess/src"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/bitmapsAndKB/Bitmaps\ and\ Keyboard\ Input.odp "samples/guiAndGfx/bitmapsAndKB"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/bitmapsAndKB/Bitmap/bitmap.ec ../samples/guiAndGfx/bitmapsAndKB/Bitmap/bitmap.epj "samples/guiAndGfx/bitmapsAndKB/Bitmap"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/bitmapsAndKB/KBController/controller.ec ../samples/guiAndGfx/bitmapsAndKB/KBController/controller.epj "samples/guiAndGfx/bitmapsAndKB/KBController"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/bitmapsAndKB/KBOnKeyHit/OnKeyHit.ec ../samples/guiAndGfx/bitmapsAndKB/KBOnKeyHit/OnKeyHit.epj "samples/guiAndGfx/bitmapsAndKB/KBOnKeyHit"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/bitmapsAndKB/KBState/KBState.ec ../samples/guiAndGfx/bitmapsAndKB/KBState/KBState.epj "samples/guiAndGfx/bitmapsAndKB/KBState"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/bitmapsAndKB/Objects/objects.ec ../samples/guiAndGfx/bitmapsAndKB/Objects/objects.epj "samples/guiAndGfx/bitmapsAndKB/Objects"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/bitmapsAndKB/res/archer.png ../samples/guiAndGfx/bitmapsAndKB/res/castle.png ../samples/guiAndGfx/bitmapsAndKB/res/dragon.png ../samples/guiAndGfx/bitmapsAndKB/res/knight.png ../samples/guiAndGfx/bitmapsAndKB/res/mage.png ../samples/guiAndGfx/bitmapsAndKB/res/mountain.png ../samples/guiAndGfx/bitmapsAndKB/res/mountains.png ../samples/guiAndGfx/bitmapsAndKB/res/tree.png "samples/guiAndGfx/bitmapsAndKB/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/childWindows/ex1.ec ../samples/guiAndGfx/childWindows/start.epj "samples/guiAndGfx/childWindows"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/childWindows/res/stone2.jpg "samples/guiAndGfx/childWindows/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/clock/clock.ec ../samples/guiAndGfx/clock/clock.epj "samples/guiAndGfx/clock"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/Controls/controls.ec ../samples/guiAndGfx/Controls/controls.epj "samples/guiAndGfx/Controls"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/curvyweb/curvyweb.ec ../samples/guiAndGfx/curvyweb/curvyweb.epj "samples/guiAndGfx/curvyweb"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/dataBoxes/dataBoxes.ec ../samples/guiAndGfx/dataBoxes/dataBoxes.epj "samples/guiAndGfx/dataBoxes"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/DataControls/DataControls.ec ../samples/guiAndGfx/DataControls/DataControls.epj "samples/guiAndGfx/DataControls"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/disablingMovingControls/disabled_test.epj ../samples/guiAndGfx/disablingMovingControls/form2.ec "samples/guiAndGfx/disablingMovingControls"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/eNotepad/eNotepad.ec ../samples/guiAndGfx/eNotepad/eNotepad.epj "samples/guiAndGfx/eNotepad"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/FlagsDropBox/flagsDropBox.ec ../samples/guiAndGfx/FlagsDropBox/FlagsDropBox.epj "samples/guiAndGfx/FlagsDropBox"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/fliPlay/fliPlay.epj ../samples/guiAndGfx/fliPlay/FliPlayApp.ec "samples/guiAndGfx/fliPlay"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/floodFill/ePaint.epj ../samples/guiAndGfx/floodFill/floodFill.ec "samples/guiAndGfx/floodFill"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/HelloForm/helloForm.ec ../samples/guiAndGfx/HelloForm/helloForm.epj "samples/guiAndGfx/HelloForm"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/LinkLabel/linkLabel.ec ../samples/guiAndGfx/LinkLabel/LinkLabel.epj "samples/guiAndGfx/LinkLabel"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/mdiSample/mdiSample.ec ../samples/guiAndGfx/mdiSample/mdiSample.epj "samples/guiAndGfx/mdiSample"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/openrider/form1.ec ../samples/guiAndGfx/openrider/game.ec ../samples/guiAndGfx/openrider/math.ec ../samples/guiAndGfx/openrider/openrider.epj "samples/guiAndGfx/openrider"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/openrider/res/wheel.png "samples/guiAndGfx/openrider/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/openrider/samples/glitch.ort ../samples/guiAndGfx/openrider/samples/sample.ort "samples/guiAndGfx/openrider/samples"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/reminder/Reminder.ec ../samples/guiAndGfx/reminder/Reminder.epj ../samples/guiAndGfx/reminder/timeAddendum.ec "samples/guiAndGfx/reminder"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/replace/replace.ec ../samples/guiAndGfx/replace/replace.epj "samples/guiAndGfx/replace"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/screenShot/shot.ec ../samples/guiAndGfx/screenShot/Shot.epj "samples/guiAndGfx/screenShot"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/skinning/AcovelSkin.ec ../samples/guiAndGfx/skinning/form1.ec ../samples/guiAndGfx/skinning/MySkin.ec ../samples/guiAndGfx/skinning/SimSkin.ec ../samples/guiAndGfx/skinning/SkinProject.epj "samples/guiAndGfx/skinning"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/skinning/res/bottomBorder.png ../samples/guiAndGfx/skinning/res/bottomLeftBorder.png ../samples/guiAndGfx/skinning/res/bottomRightBorder.png ../samples/guiAndGfx/skinning/res/downLeft.png ../samples/guiAndGfx/skinning/res/downMiddle.png ../samples/guiAndGfx/skinning/res/downRight.png ../samples/guiAndGfx/skinning/res/leftBorder.png ../samples/guiAndGfx/skinning/res/rightBorder.png ../samples/guiAndGfx/skinning/res/thumbDown.png ../samples/guiAndGfx/skinning/res/thumbUp.png "samples/guiAndGfx/skinning/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/skinning/res/thumbVert.png ../samples/guiAndGfx/skinning/res/topBorder.png ../samples/guiAndGfx/skinning/res/topLeftBorder.png ../samples/guiAndGfx/skinning/res/topRightBorder.png ../samples/guiAndGfx/skinning/res/upLeft.png ../samples/guiAndGfx/skinning/res/upMiddle.png ../samples/guiAndGfx/skinning/res/upRight.png "samples/guiAndGfx/skinning/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/slideShow/eShow.ec ../samples/guiAndGfx/slideShow/eShow.epj "samples/guiAndGfx/slideShow"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/snow/snow.ec ../samples/guiAndGfx/snow/snow.epj "samples/guiAndGfx/snow"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/stacker/stackerTest.ec ../samples/guiAndGfx/stacker/stackerTest.epj "samples/guiAndGfx/stacker"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/tabControl/tabs.ec ../samples/guiAndGfx/tabControl/tabs.epj "samples/guiAndGfx/tabControl"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/textScroller/Scroll.epj ../samples/guiAndGfx/textScroller/textScroller.ec "samples/guiAndGfx/textScroller"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/toolBars/toolBarDemo.ec ../samples/guiAndGfx/toolBars/toolBars.epj "samples/guiAndGfx/toolBars"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/toolTips/toolTips.ec ../samples/guiAndGfx/toolTips/Tooltips.epj "samples/guiAndGfx/toolTips"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/treeView/explorer.ec ../samples/guiAndGfx/treeView/treeView.epj "samples/guiAndGfx/treeView"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/pictureRotateAlpha/image.png ../samples/guiAndGfx/pictureRotateAlpha/pictureRotate.epj ../samples/guiAndGfx/pictureRotateAlpha/rotate1.ec "samples/guiAndGfx/pictureRotateAlpha"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/fractals/fractals.ec ../samples/guiAndGfx/fractals/fractals.epj ../samples/guiAndGfx/fractals/GradientDesigner.ec "samples/guiAndGfx/fractals"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/fractals/samples/colorful.frc ../samples/guiAndGfx/fractals/samples/coolSpiral.frc ../samples/guiAndGfx/fractals/samples/deep.frc ../samples/guiAndGfx/fractals/samples/hot.frc ../samples/guiAndGfx/fractals/samples/hot2.frc ../samples/guiAndGfx/fractals/samples/minibrot.frc ../samples/guiAndGfx/fractals/samples/MOI.frc ../samples/guiAndGfx/fractals/samples/nicejulia.frc ../samples/guiAndGfx/fractals/samples/oldColors.frc ../samples/guiAndGfx/fractals/samples/purplishmandelbrot.frc "samples/guiAndGfx/fractals/samples"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/fractals/samples/seaHorseValley.frc ../samples/guiAndGfx/fractals/samples/star.frc ../samples/guiAndGfx/fractals/samples/sunnySpiral.frc ../samples/guiAndGfx/fractals/samples/woah.frc "samples/guiAndGfx/fractals/samples"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/mandelbrot/mandelbrot.ec ../samples/guiAndGfx/mandelbrot/mandelbrot.epj ../samples/guiAndGfx/mandelbrot/mandelbrotUI.ec "samples/guiAndGfx/mandelbrot"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/mekano/mekano.ec ../samples/guiAndGfx/mekano/mekano.epj ../samples/guiAndGfx/mekano/mekanodisplay.ec ../samples/guiAndGfx/mekano/mekanoobject.ec ../samples/guiAndGfx/mekano/mekanoobjectfixed.ec ../samples/guiAndGfx/mekano/mekanoobjectgravity.ec ../samples/guiAndGfx/mekano/mekanoobjectpolygonal.ec ../samples/guiAndGfx/mekano/mekanoobjectspring.ec ../samples/guiAndGfx/mekano/mekanopoint.ec ../samples/guiAndGfx/mekano/mekanopolygon.ec "samples/guiAndGfx/mekano"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/guiAndGfx/mekano/mekanopolygonalbox.ec ../samples/guiAndGfx/mekano/mekanosimulation.ec ../samples/guiAndGfx/mekano/mekanownd.ec ../samples/guiAndGfx/mekano/vector.ec "samples/guiAndGfx/mekano"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/misc/licensing/licensing.ec ../samples/misc/licensing/licensing.epj ../samples/misc/licensing/myapp.LICENSE "samples/misc/licensing"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/net/DCOMSample/main.ec ../samples/net/DCOMSample/Server.ec ../samples/net/DCOMSample/Server.epj "samples/net/DCOMSample"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/net/eCom/connection.ec ../samples/net/eCom/eCom.epj ../samples/net/eCom/mainPanel.ec "samples/net/eCom"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/net/eirc/console.ec ../samples/net/eirc/eIRC.ec ../samples/net/eirc/eIRC.epj "samples/net/eirc"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/net/httpserver/http.ec ../samples/net/httpserver/httpServer.epj "samples/net/httpserver"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/net/networkFile/NetworkClient/client.ec ../samples/net/networkFile/NetworkClient/NetworkClient.epj "samples/net/networkFile/NetworkClient"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/net/networkFile/NetworkServer/NetworkServer.epj ../samples/net/networkFile/NetworkServer/server.ec "samples/net/networkFile/NetworkServer"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/net/smtp/smtp.ec ../samples/net/smtp/smtp.epj "samples/net/smtp"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/net/SocketSample/socketSample.ec ../samples/net/SocketSample/SocketSample.epj "samples/net/SocketSample"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/net/UDPSample/udptest.ec ../samples/net/UDPSample/UDPTest.epj "samples/net/UDPSample"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/net/XMLSample/xmlSample.ec ../samples/net/XMLSample/XMLSample.epj "samples/net/XMLSample"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/net/browser/browser.ec ../samples/net/browser/browser.epj ../samples/net/browser/newb.ico ../samples/net/browser/newb.png ../samples/net/browser/resources.rc "samples/net/browser"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/net/SocketRx/socketRx.ec ../samples/net/SocketRx/socketRx.epj "samples/net/SocketRx"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/net/SocketTx/socketTX.ec ../samples/net/SocketTx/socketTX.epj "samples/net/SocketTx"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/scanning/wiaTest/wiaTest.ec ../samples/scanning/wiaTest/wiaTest.epj "samples/scanning/wiaTest"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/threads/threadsAndListBoxes/blank.ec ../samples/threads/threadsAndListBoxes/blank.epj "samples/threads/threadsAndListBoxes"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/android/helloAndroid.ec ../samples/android/helloAndroid.epj ../samples/android/note.txt "samples/android"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/android/android/AndroidManifest.xml "samples/android/android"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/android/android/res/values/strings.xml "samples/android/android/res/values"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../samples/android/res/ecere\ sdk.png "samples/android/res"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/base64.ec ../extras/CSVDataParser.ec ../extras/CSVParser.ec ../extras/EnvironmentVariables.ec ../extras/FileSystemIterator.ec ../extras/fli.ec ../extras/fliPlay.ec ../extras/md5.ec ../extras/Regex.ec ../extras/sha256.ec "extras"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/SMTPSocket.ec ../extras/timeTools.ec ../extras/wia.ec ../extras/windowsShortcut.ec ../extras/XMLParser.ec ../extras/createLink.ec ../extras/stringTools.ec "extras"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/gui/IconBag.ec ../extras/gui/layout.ec ../extras/gui/LicensesDialog.ec ../extras/gui/RoundedSquare.ec ../extras/gui/genericEditor.ec "extras/gui"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/gui/controls/CheckListBox.ec ../extras/gui/controls/LogBox.ec ../extras/gui/controls/PasswordBox.ec ../extras/gui/controls/SearchBox.ec ../extras/gui/controls/StringsBox.ec "extras/gui/controls"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/gui/skins/SimSkin.ec "extras/gui/skins"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/html/htmlParser.ec ../extras/html/HTMLView.ec ../extras/html/lines.ec ../extras/html/tables.ec "extras/html"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/licenses/crystalicons.LICENSE ../extras/res/licenses/ecere.LICENSE ../extras/res/licenses/ffi.LICENSE ../extras/res/licenses/freetype.LICENSE ../extras/res/licenses/gpl2.LICENSE ../extras/res/licenses/gpl3.LICENSE ../extras/res/licenses/harfbuzz.LICENSE ../extras/res/licenses/jpg.LICENSE ../extras/res/licenses/lgpl2.LICENSE ../extras/res/licenses/lgpl3.LICENSE "extras/res/licenses"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/licenses/MinGW-w64.LICENSE ../extras/res/licenses/openSSL.LICENSE ../extras/res/licenses/png.LICENSE ../extras/res/licenses/sqlcipher.LICENSE ../extras/res/licenses/sqlite.LICENSE ../extras/res/licenses/tango.COPYING ../extras/res/licenses/tdm-gcc.LICENSE ../extras/res/licenses/ungif.LICENSE ../extras/res/licenses/upx.LICENSE ../extras/res/licenses/zlib.README "extras/res/licenses"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/ad.png ../extras/res/types/countryCode/ae.png ../extras/res/types/countryCode/af.png ../extras/res/types/countryCode/ag.png ../extras/res/types/countryCode/ai.png ../extras/res/types/countryCode/al.png ../extras/res/types/countryCode/am.png ../extras/res/types/countryCode/an.png ../extras/res/types/countryCode/ao.png ../extras/res/types/countryCode/ar.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/as.png ../extras/res/types/countryCode/at.png ../extras/res/types/countryCode/au.png ../extras/res/types/countryCode/aw.png ../extras/res/types/countryCode/ax.png ../extras/res/types/countryCode/az.png ../extras/res/types/countryCode/ba.png ../extras/res/types/countryCode/bb.png ../extras/res/types/countryCode/bd.png ../extras/res/types/countryCode/be.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/bf.png ../extras/res/types/countryCode/bg.png ../extras/res/types/countryCode/bh.png ../extras/res/types/countryCode/bi.png ../extras/res/types/countryCode/bj.png ../extras/res/types/countryCode/bm.png ../extras/res/types/countryCode/bn.png ../extras/res/types/countryCode/bo.png ../extras/res/types/countryCode/br.png ../extras/res/types/countryCode/bs.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/bt.png ../extras/res/types/countryCode/bv.png ../extras/res/types/countryCode/bw.png ../extras/res/types/countryCode/by.png ../extras/res/types/countryCode/bz.png ../extras/res/types/countryCode/ca.png ../extras/res/types/countryCode/catalonia.png ../extras/res/types/countryCode/cc.png ../extras/res/types/countryCode/cd.png ../extras/res/types/countryCode/cf.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/cg.png ../extras/res/types/countryCode/ch.png ../extras/res/types/countryCode/ci.png ../extras/res/types/countryCode/ck.png ../extras/res/types/countryCode/cl.png ../extras/res/types/countryCode/cm.png ../extras/res/types/countryCode/cn.png ../extras/res/types/countryCode/co.png ../extras/res/types/countryCode/cr.png ../extras/res/types/countryCode/cs.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/cu.png ../extras/res/types/countryCode/cv.png ../extras/res/types/countryCode/cx.png ../extras/res/types/countryCode/cy.png ../extras/res/types/countryCode/cz.png ../extras/res/types/countryCode/de.png ../extras/res/types/countryCode/dj.png ../extras/res/types/countryCode/dk.png ../extras/res/types/countryCode/dm.png ../extras/res/types/countryCode/do.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/dz.png ../extras/res/types/countryCode/ec.png ../extras/res/types/countryCode/ee.png ../extras/res/types/countryCode/eg.png ../extras/res/types/countryCode/eh.png ../extras/res/types/countryCode/england.png ../extras/res/types/countryCode/er.png ../extras/res/types/countryCode/es.png ../extras/res/types/countryCode/et.png ../extras/res/types/countryCode/europeanunion.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/fam.png ../extras/res/types/countryCode/fi.png ../extras/res/types/countryCode/fj.png ../extras/res/types/countryCode/fk.png ../extras/res/types/countryCode/fm.png ../extras/res/types/countryCode/fo.png ../extras/res/types/countryCode/fr.png ../extras/res/types/countryCode/ga.png ../extras/res/types/countryCode/gb.png ../extras/res/types/countryCode/gd.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/ge.png ../extras/res/types/countryCode/gf.png ../extras/res/types/countryCode/gh.png ../extras/res/types/countryCode/gi.png ../extras/res/types/countryCode/gl.png ../extras/res/types/countryCode/gm.png ../extras/res/types/countryCode/gn.png ../extras/res/types/countryCode/gp.png ../extras/res/types/countryCode/gq.png ../extras/res/types/countryCode/gr.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/gs.png ../extras/res/types/countryCode/gt.png ../extras/res/types/countryCode/gu.png ../extras/res/types/countryCode/gw.png ../extras/res/types/countryCode/gy.png ../extras/res/types/countryCode/hk.png ../extras/res/types/countryCode/hm.png ../extras/res/types/countryCode/hn.png ../extras/res/types/countryCode/hr.png ../extras/res/types/countryCode/ht.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/hu.png ../extras/res/types/countryCode/id.png ../extras/res/types/countryCode/ie.png ../extras/res/types/countryCode/il.png ../extras/res/types/countryCode/in.png ../extras/res/types/countryCode/io.png ../extras/res/types/countryCode/iq.png ../extras/res/types/countryCode/ir.png ../extras/res/types/countryCode/is.png ../extras/res/types/countryCode/it.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/jm.png ../extras/res/types/countryCode/jo.png ../extras/res/types/countryCode/jp.png ../extras/res/types/countryCode/ke.png ../extras/res/types/countryCode/kg.png ../extras/res/types/countryCode/kh.png ../extras/res/types/countryCode/ki.png ../extras/res/types/countryCode/km.png ../extras/res/types/countryCode/kn.png ../extras/res/types/countryCode/kp.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/kr.png ../extras/res/types/countryCode/kw.png ../extras/res/types/countryCode/ky.png ../extras/res/types/countryCode/kz.png ../extras/res/types/countryCode/la.png ../extras/res/types/countryCode/lb.png ../extras/res/types/countryCode/lc.png ../extras/res/types/countryCode/li.png ../extras/res/types/countryCode/lk.png ../extras/res/types/countryCode/lr.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/ls.png ../extras/res/types/countryCode/lt.png ../extras/res/types/countryCode/lu.png ../extras/res/types/countryCode/lv.png ../extras/res/types/countryCode/ly.png ../extras/res/types/countryCode/ma.png ../extras/res/types/countryCode/mc.png ../extras/res/types/countryCode/md.png ../extras/res/types/countryCode/me.png ../extras/res/types/countryCode/mg.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/mh.png ../extras/res/types/countryCode/mk.png ../extras/res/types/countryCode/ml.png ../extras/res/types/countryCode/mm.png ../extras/res/types/countryCode/mn.png ../extras/res/types/countryCode/mo.png ../extras/res/types/countryCode/mp.png ../extras/res/types/countryCode/mq.png ../extras/res/types/countryCode/mr.png ../extras/res/types/countryCode/ms.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/mt.png ../extras/res/types/countryCode/mu.png ../extras/res/types/countryCode/mv.png ../extras/res/types/countryCode/mw.png ../extras/res/types/countryCode/mx.png ../extras/res/types/countryCode/my.png ../extras/res/types/countryCode/mz.png ../extras/res/types/countryCode/na.png ../extras/res/types/countryCode/nc.png ../extras/res/types/countryCode/ne.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/nf.png ../extras/res/types/countryCode/ng.png ../extras/res/types/countryCode/ni.png ../extras/res/types/countryCode/nl.png ../extras/res/types/countryCode/no.png ../extras/res/types/countryCode/np.png ../extras/res/types/countryCode/nr.png ../extras/res/types/countryCode/nu.png ../extras/res/types/countryCode/nz.png ../extras/res/types/countryCode/om.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/pa.png ../extras/res/types/countryCode/pe.png ../extras/res/types/countryCode/pf.png ../extras/res/types/countryCode/pg.png ../extras/res/types/countryCode/ph.png ../extras/res/types/countryCode/pk.png ../extras/res/types/countryCode/pl.png ../extras/res/types/countryCode/pm.png ../extras/res/types/countryCode/pn.png ../extras/res/types/countryCode/pr.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/ps.png ../extras/res/types/countryCode/pt.png ../extras/res/types/countryCode/pw.png ../extras/res/types/countryCode/py.png ../extras/res/types/countryCode/qa.png ../extras/res/types/countryCode/re.png ../extras/res/types/countryCode/ro.png ../extras/res/types/countryCode/rs.png ../extras/res/types/countryCode/ru.png ../extras/res/types/countryCode/rw.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/sa.png ../extras/res/types/countryCode/sb.png ../extras/res/types/countryCode/sc.png ../extras/res/types/countryCode/scotland.png ../extras/res/types/countryCode/sd.png ../extras/res/types/countryCode/se.png ../extras/res/types/countryCode/sg.png ../extras/res/types/countryCode/sh.png ../extras/res/types/countryCode/si.png ../extras/res/types/countryCode/sj.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/sk.png ../extras/res/types/countryCode/sl.png ../extras/res/types/countryCode/sm.png ../extras/res/types/countryCode/sn.png ../extras/res/types/countryCode/so.png ../extras/res/types/countryCode/sr.png ../extras/res/types/countryCode/st.png ../extras/res/types/countryCode/sv.png ../extras/res/types/countryCode/sy.png ../extras/res/types/countryCode/sz.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/tc.png ../extras/res/types/countryCode/td.png ../extras/res/types/countryCode/tf.png ../extras/res/types/countryCode/tg.png ../extras/res/types/countryCode/th.png ../extras/res/types/countryCode/tj.png ../extras/res/types/countryCode/tk.png ../extras/res/types/countryCode/tl.png ../extras/res/types/countryCode/tm.png ../extras/res/types/countryCode/tn.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/to.png ../extras/res/types/countryCode/tr.png ../extras/res/types/countryCode/tt.png ../extras/res/types/countryCode/tv.png ../extras/res/types/countryCode/tw.png ../extras/res/types/countryCode/tz.png ../extras/res/types/countryCode/ua.png ../extras/res/types/countryCode/ug.png ../extras/res/types/countryCode/um.png ../extras/res/types/countryCode/us.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/uy.png ../extras/res/types/countryCode/uz.png ../extras/res/types/countryCode/va.png ../extras/res/types/countryCode/vc.png ../extras/res/types/countryCode/ve.png ../extras/res/types/countryCode/vg.png ../extras/res/types/countryCode/vi.png ../extras/res/types/countryCode/vn.png ../extras/res/types/countryCode/vu.png ../extras/res/types/countryCode/wales.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/wf.png ../extras/res/types/countryCode/ws.png ../extras/res/types/countryCode/ye.png ../extras/res/types/countryCode/yt.png ../extras/res/types/countryCode/za.png ../extras/res/types/countryCode/zm.png ../extras/res/types/countryCode/zw.png "extras/res/types/countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/tiles/astar.ec ../extras/tiles/sequence.ec ../extras/tiles/sprite.ec ../extras/tiles/tiles.ec "extras/tiles"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/types/CountryCode.ec ../extras/types/Currency.ec ../extras/types/ShortDate.ec ../extras/types/DynamicString.ec "extras/types"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/licenses/freetype.LICENSE ../extras/res/licenses/harfbuzz.LICENSE ../extras/res/licenses/jpg.LICENSE ../extras/res/licenses/png.LICENSE ../extras/res/licenses/sqlite.LICENSE ../extras/res/licenses/tango.COPYING ../extras/res/licenses/ungif.LICENSE ../extras/res/licenses/upx.LICENSE ../extras/res/licenses/zlib.README ../LICENSE "licenses"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/licenses/MinGW-w64.LICENSE ../extras/res/licenses/tdm-gcc.LICENSE ../extras/res/licenses/ffi.LICENSE "licenses"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../obj/win32.x32/bin/ecere.dll ../obj/win32.x32/lib/libecereVanilla.a ../obj/win32.x32/bin/EcereAudio.dll "ecere-sdk32"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../obj/win32.x32/bin/documentor.exe ../obj/win32.x32/bin/ecere-ide.exe "ecere-sdk32/ide"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../obj/win32.x32/bin/ear.exe ../obj/win32.x32/bin/ec.dll ../obj/win32.x32/bin/ecc.exe ../obj/win32.x32/bin/ecereCOM.dll ../obj/win32.x32/bin/ecp.exe ../obj/win32.x32/bin/ecs.exe ../obj/win32.x32/bin/epj2make.exe "ecere-sdk32/compiler"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../obj/win32.x32/bin/EDA.dll ../obj/win32.x32/bin/EDASQLite.dll "ecere-sdk32/eda"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gdb/gdb.exe tdm/gdb/i686-w64-mingw32-gdb.exe "tdm/gdb/bin"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/binutils-2.25-tdm64-1/COPYING.winpthreads.txt tdm/binutils-2.25-tdm64-1/COPYING3-gcc-tdm.txt tdm/binutils-2.25-tdm64-1/COPYING3.LIB-gcc-tdm.txt "tdm/binutils/licenses"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/binutils-2.25-tdm64-1/bin/addr2line.exe tdm/binutils-2.25-tdm64-1/bin/ar.exe tdm/binutils-2.25-tdm64-1/bin/as.exe tdm/binutils-2.25-tdm64-1/bin/c++filt.exe tdm/binutils-2.25-tdm64-1/bin/dlltool.exe tdm/binutils-2.25-tdm64-1/bin/dllwrap.exe tdm/binutils-2.25-tdm64-1/bin/elfedit.exe tdm/binutils-2.25-tdm64-1/bin/gprof.exe tdm/binutils-2.25-tdm64-1/bin/ld.bfd.exe tdm/binutils-2.25-tdm64-1/bin/ld.exe "tdm/binutils/bin"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/binutils-2.25-tdm64-1/bin/nm.exe tdm/binutils-2.25-tdm64-1/bin/objcopy.exe tdm/binutils-2.25-tdm64-1/bin/objdump.exe tdm/binutils-2.25-tdm64-1/bin/ranlib.exe tdm/binutils-2.25-tdm64-1/bin/readelf.exe tdm/binutils-2.25-tdm64-1/bin/size.exe tdm/binutils-2.25-tdm64-1/bin/strings.exe tdm/binutils-2.25-tdm64-1/bin/strip.exe tdm/binutils-2.25-tdm64-1/bin/windmc.exe tdm/binutils-2.25-tdm64-1/bin/windres.exe "tdm/binutils/bin"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/binutils-2.25-tdm64-1/include/ansidecl.h tdm/binutils-2.25-tdm64-1/include/bfd.h tdm/binutils-2.25-tdm64-1/include/bfdlink.h tdm/binutils-2.25-tdm64-1/include/dis-asm.h tdm/binutils-2.25-tdm64-1/include/plugin-api.h tdm/binutils-2.25-tdm64-1/include/symcat.h "tdm/binutils/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/binutils-2.25-tdm64-1/lib/libbfd.a tdm/binutils-2.25-tdm64-1/lib/libopcodes.a "tdm/binutils/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/ar.exe tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/as.exe tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/dlltool.exe tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/ld.bfd.exe tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/ld.exe tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/nm.exe tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/objcopy.exe tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/objdump.exe tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/ranlib.exe tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/bin/strip.exe "tdm/binutils/x86_64-w64-mingw32/bin"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pe.x tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pe.xa tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pe.xbn tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pe.xn tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pe.xr tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pe.xu tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pep.x tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pep.xa tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pep.xbn tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pep.xn "tdm/binutils/x86_64-w64-mingw32/lib/ldscripts"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pep.xr tdm/binutils-2.25-tdm64-1/x86_64-w64-mingw32/lib/ldscripts/i386pep.xu "tdm/binutils/x86_64-w64-mingw32/lib/ldscripts"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/bin/cpp.exe tdm/gcc-5.1.0-tdm64-1-core/bin/gcc-ar.exe tdm/gcc-5.1.0-tdm64-1-core/bin/gcc-nm.exe tdm/gcc-5.1.0-tdm64-1-core/bin/gcc-ranlib.exe tdm/gcc-5.1.0-tdm64-1-core/bin/gcc.exe tdm/gcc-5.1.0-tdm64-1-core/bin/gcov-tool.exe tdm/gcc-5.1.0-tdm64-1-core/bin/gcov.exe tdm/gcc-5.1.0-tdm64-1-core/bin/libatomic-1.dll tdm/gcc-5.1.0-tdm64-1-core/bin/libatomic_64-1.dll tdm/gcc-5.1.0-tdm64-1-core/bin/libgcc_s_seh_64-1.dll "tdm/gcc/core/bin"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/bin/libgcc_s_sjlj-1.dll tdm/gcc-5.1.0-tdm64-1-core/bin/libiconv-2.dll tdm/gcc-5.1.0-tdm64-1-core/bin/libquadmath-0.dll tdm/gcc-5.1.0-tdm64-1-core/bin/libquadmath_64-0.dll tdm/gcc-5.1.0-tdm64-1-core/bin/libssp-0.dll tdm/gcc-5.1.0-tdm64-1-core/bin/libssp_64-0.dll tdm/gcc-5.1.0-tdm64-1-core/bin/libvtv-0.dll tdm/gcc-5.1.0-tdm64-1-core/bin/libvtv_64-0.dll tdm/gcc-5.1.0-tdm64-1-core/bin/libvtv_stubs-0.dll tdm/gcc-5.1.0-tdm64-1-core/bin/libvtv_stubs_64-0.dll "tdm/gcc/core/bin"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/bin/libwinpthread-1.dll tdm/gcc-5.1.0-tdm64-1-core/bin/libwinpthread_64-1.dll tdm/gcc-5.1.0-tdm64-1-core/bin/x86_64-w64-mingw32-gcc-5.1.0.exe tdm/gcc-5.1.0-tdm64-1-core/bin/x86_64-w64-mingw32-gcc-ar.exe tdm/gcc-5.1.0-tdm64-1-core/bin/x86_64-w64-mingw32-gcc-nm.exe tdm/gcc-5.1.0-tdm64-1-core/bin/x86_64-w64-mingw32-gcc-ranlib.exe tdm/gcc-5.1.0-tdm64-1-core/bin/x86_64-w64-mingw32-gcc.exe "tdm/gcc/core/bin"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/crtbegin.o tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/crtend.o tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/crtfastmath.o tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libatomic.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libatomic.dll.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libgcc.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libgcc_s.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libgcov.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libquadmath.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libquadmath.dll.a "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libssp.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libssp.dll.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libssp_nonshared.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libvtv.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libvtv.dll.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libvtv_stubs.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/libvtv_stubs.dll.a "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/crtbegin.o tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/crtend.o tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/crtfastmath.o tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libatomic.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libatomic.dll.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libcaf_single.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libgcc.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libgcc_s.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libgcov.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libquadmath.a "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0/32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libquadmath.dll.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libssp.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libssp.dll.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libssp_nonshared.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libvtv.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libvtv.dll.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libvtv_stubs.a tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libvtv_stubs.dll.a "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0/32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/finclude/ieee_arithmetic.mod tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/finclude/ieee_exceptions.mod tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/finclude/ieee_features.mod "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0/32/finclude"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/adxintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/ammintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx2intrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512bwintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512cdintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512dqintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512erintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512fintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512ifmaintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512ifmavlintrin.h "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512pfintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512vbmiintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512vbmivlintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512vlbwintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512vldqintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avx512vlintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/avxintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/bmi2intrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/bmiintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/bmmintrin.h "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/clflushoptintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/clwbintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/cpuid.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/cross-stdarg.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/emmintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/f16cintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/float.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/fma4intrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/fmaintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/fxsrintrin.h "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/ia32intrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/immintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/iso646.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/lwpintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/lzcntintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/mm3dnow.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/mmintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/mm_malloc.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/nmmintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/omp.h "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/openacc.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/pcommitintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/pmmintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/popcntintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/prfchwintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/quadmath.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/quadmath_weak.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/rdseedintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/rtmintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/shaintrin.h "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/smmintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stdalign.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stdarg.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stdatomic.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stdbool.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stddef.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stdfix.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stdint-gcc.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stdint.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/stdnoreturn.h "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/tbmintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/tgmath.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/tmmintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/unwind.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/varargs.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/wmmintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/x86intrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/xmmintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/xopintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/xsavecintrin.h "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/xsaveintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/xsaveoptintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/xsavesintrin.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/xtestintrin.h "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/ssp/ssp.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/ssp/stdio.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/ssp/string.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/ssp/unistd.h "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0/include/ssp"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include-fixed/limits.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include-fixed/README tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/include-fixed/syslimits.h "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0/include-fixed"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/install-tools/fixinc_list tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/install-tools/gsyslimits.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/install-tools/macro_list tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/install-tools/mkheaders.conf "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0/install-tools"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/install-tools/include/limits.h tdm/gcc-5.1.0-tdm64-1-core/lib/gcc/x86_64-w64-mingw32/5.1.0/install-tools/include/README "tdm/gcc/core/lib/gcc/x86_64-w64-mingw32/5.1.0/install-tools/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/cc1.exe tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/collect2.exe tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/libgmp-3.dll tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/libiconv-2.dll tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/libisl-13.dll tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/liblto_plugin-0.dll tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/liblto_plugin.dll.a tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/libmpc-2.dll tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/libmpfr-1.dll tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/lto-wrapper.exe "tdm/gcc/core/libexec/gcc/x86_64-w64-mingw32/5.1.0"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/lto1.exe "tdm/gcc/core/libexec/gcc/x86_64-w64-mingw32/5.1.0"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/install-tools/fixinc.sh tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/install-tools/fixincl.exe tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/install-tools/mkheaders tdm/gcc-5.1.0-tdm64-1-core/libexec/gcc/x86_64-w64-mingw32/5.1.0/install-tools/mkinstalldirs "tdm/gcc/core/libexec/gcc/x86_64-w64-mingw32/5.1.0/install-tools"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/licenses/COPYING.ISL.txt tdm/gcc-5.1.0-tdm64-1-core/licenses/COPYING.RUNTIME-gcc-tdm.txt tdm/gcc-5.1.0-tdm64-1-core/licenses/COPYING.winpthreads.txt tdm/gcc-5.1.0-tdm64-1-core/licenses/COPYING3-gcc-tdm.txt tdm/gcc-5.1.0-tdm64-1-core/licenses/COPYING3.LIB-gcc-tdm.txt tdm/gcc-5.1.0-tdm64-1-core/licenses/README-gcc-tdm64.txt "tdm/gcc/core/licenses"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/share/info/cpp.info tdm/gcc-5.1.0-tdm64-1-core/share/info/cppinternals.info tdm/gcc-5.1.0-tdm64-1-core/share/info/gcc.info tdm/gcc-5.1.0-tdm64-1-core/share/info/gccinstall.info tdm/gcc-5.1.0-tdm64-1-core/share/info/gccint.info tdm/gcc-5.1.0-tdm64-1-core/share/info/libquadmath.info "tdm/gcc/core/share/info"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/share/man/man1/cpp.1 tdm/gcc-5.1.0-tdm64-1-core/share/man/man1/gcc.1 tdm/gcc-5.1.0-tdm64-1-core/share/man/man1/gcov.1 "tdm/gcc/core/share/man/man1"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/share/man/man7/fsf-funding.7 tdm/gcc-5.1.0-tdm64-1-core/share/man/man7/gfdl.7 tdm/gcc-5.1.0-tdm64-1-core/share/man/man7/gpl.7 "tdm/gcc/core/share/man/man7"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/include/pthread.h tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/include/pthread_compat.h tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/include/pthread_signal.h tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/include/pthread_time.h tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/include/pthread_unistd.h tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/include/sched.h tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/include/semaphore.h "tdm/gcc/core/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/lib/libpthread.a tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/lib/libpthread_s.dll.a tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/lib/libwinpthread.a tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/lib/libwinpthread.dll.a "tdm/gcc/core/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/lib32/libpthread.a tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/lib32/libpthread_s.dll.a tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/lib32/libwinpthread.a tdm/gcc-5.1.0-tdm64-1-core/x86_64-w64-mingw32/lib32/libwinpthread.dll.a "tdm/gcc/core/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/bin/c++.exe tdm/gcc-5.1.0-tdm64-1-c++/bin/g++.exe tdm/gcc-5.1.0-tdm64-1-c++/bin/libstdc++-6.dll tdm/gcc-5.1.0-tdm64-1-c++/bin/libstdc++_64-6.dll tdm/gcc-5.1.0-tdm64-1-c++/bin/x86_64-w64-mingw32-c++.exe tdm/gcc-5.1.0-tdm64-1-c++/bin/x86_64-w64-mingw32-g++.exe "tdm/gcc/c++/bin"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/libstdc++.a tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/libstdc++.dll.a tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/libstdc++_64-6.dll-gdb.py tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/libsupc++.a "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libstdc++-6.dll-gdb.py tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libstdc++.a tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libstdc++.dll.a tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/32/libsupc++.a "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/algorithm tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/array tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/atomic tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bitset tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cassert tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ccomplex tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cctype tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cerrno tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cfenv tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cfloat "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/chrono tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cinttypes tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ciso646 tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/climits tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/clocale tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cmath tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/codecvt tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/complex tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/complex.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/condition_variable "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/csetjmp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/csignal tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cstdalign tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cstdarg tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cstdbool tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cstddef tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cstdint tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cstdio tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cstdlib tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cstring "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ctgmath tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ctime tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cwchar tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cwctype tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/cxxabi.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/deque tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/exception tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/fenv.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/forward_list tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/fstream "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/functional tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/future tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/initializer_list tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/iomanip tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ios tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/iosfwd tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/iostream tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/istream tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/iterator tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/limits "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/list tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/locale tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/map tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/memory tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/mutex tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/new tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/numeric tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ostream tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/queue tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/random "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ratio tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/regex tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/scoped_allocator tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/set tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/shared_mutex tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/sstream tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/stack tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/stdexcept tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/streambuf tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/string "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/system_error tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tgmath.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/thread tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tuple tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/typeindex tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/typeinfo tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/type_traits tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/unordered_map tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/unordered_set tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/utility "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/valarray tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/vector "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward/auto_ptr.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward/backward_warning.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward/binders.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward/hashtable.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward/hash_fun.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward/hash_map tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward/hash_set tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward/strstream "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/backward"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/algorithmfwd.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/allocated_ptr.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/allocator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/alloc_traits.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/atomic_base.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/atomic_futex.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/atomic_lockfree_defines.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/basic_ios.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/basic_ios.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/basic_string.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/basic_string.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/boost_concept_check.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/c++0x_warning.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/c++14_warning.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/char_traits.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/codecvt.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/concept_check.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/cpp_type_traits.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/cxxabi_forced.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/deque.tcc "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/enable_special_members.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/exception_defines.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/exception_ptr.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/forward_list.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/forward_list.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/fstream.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/functexcept.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/functional_hash.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/gslice.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/gslice_array.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/hashtable.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/hashtable_policy.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/hash_bytes.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/indirect_array.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/ios_base.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/istream.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/list.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/localefwd.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/locale_classes.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/locale_classes.tcc "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/locale_conv.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/locale_facets.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/locale_facets.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/locale_facets_nonio.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/locale_facets_nonio.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/mask_array.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/memoryfwd.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/move.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/nested_exception.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/ostream.tcc "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/ostream_insert.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/parse_numbers.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/postypes.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/predefined_ops.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/ptr_traits.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/random.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/random.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/range_access.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex.tcc "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_automaton.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_automaton.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_compiler.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_compiler.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_constants.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_error.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_executor.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_executor.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_scanner.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/regex_scanner.tcc "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/shared_ptr.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/shared_ptr_atomic.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/shared_ptr_base.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/slice_array.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/sstream.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_algo.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_algobase.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_bvector.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_construct.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_deque.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_function.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_heap.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_iterator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_iterator_base_funcs.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_iterator_base_types.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_list.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_map.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_multimap.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_multiset.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_numeric.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_pair.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_queue.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_raw_storage_iter.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_relops.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_set.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_stack.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_tempbuf.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_tree.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_uninitialized.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stl_vector.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/streambuf.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/streambuf_iterator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stream_iterator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/stringfwd.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/unique_ptr.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/unordered_map.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/unordered_set.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/uses_allocator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/valarray_after.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/valarray_array.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/valarray_array.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/valarray_before.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits/vector.tcc "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/array tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/bitset tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/debug.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/deque tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/formatter.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/forward_list tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/functions.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/list tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/macros.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/map "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/map.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/multimap.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/multiset.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_base.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_container.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_iterator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_iterator.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_local_iterator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_local_iterator.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_sequence.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_sequence.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_unordered_base.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_unordered_container.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/safe_unordered_container.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/set tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/set.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/string tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/unordered_map tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/unordered_set tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug/vector "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/debug"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/decimal/decimal tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/decimal/decimal.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/decimal"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/algorithm tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/any tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/chrono tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/functional tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/optional tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/ratio tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/string_view tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/string_view.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/system_error tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/tuple "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental/type_traits "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/experimental"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/algorithm tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/aligned_buffer.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/alloc_traits.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/array_allocator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/atomicity.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/bitmap_allocator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/cast.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/cmath tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/codecvt_specializations.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/concurrence.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/debug_allocator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/enc_filebuf.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/extptr_allocator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/functional tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/hash_map tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/hash_set tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/iterator tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/malloc_allocator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/memory tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/mt_allocator.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/new_allocator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/numeric tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/numeric_traits.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pod_char_traits.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pointer.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pool_allocator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/random tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/random.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/rb_tree tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/rc_string_base.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/rope tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/ropeimpl.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/slist tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/sso_string_base.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/stdio_filebuf.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/stdio_sync_filebuf.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/string_conversions.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/throw_allocator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/typelist.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/type_traits.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/vstring.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/vstring.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/vstring_fwd.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/vstring_util.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/assoc_container.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/exception.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/hash_policy.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/list_update_policy.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/priority_queue.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/tag_and_trait.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/tree_policy.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/trie_policy.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cond_dealtor.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/container_base_dispatch.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/debug_map_base.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/priority_queue_base_dispatch.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/standard_policies.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/tree_trace_base.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/types_traits.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/type_utils.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/binary_heap_.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/constructors_destructor_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/const_iterator.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/debug_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/entry_cmp.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/entry_pred.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/find_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/info_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/insert_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/iterators_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/point_const_iterator.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/policy_access_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/resize_policy.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/split_join_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_/trace_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binary_heap_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_/binomial_heap_.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_/constructors_destructor_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_/debug_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_base_/binomial_heap_base_.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_base_/constructors_destructor_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_base_/debug_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_base_/erase_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_base_/find_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_base_/insert_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_base_/split_join_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/binomial_heap_base_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/bin_search_tree_.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/constructors_destructor_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/debug_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/erase_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/find_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/info_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/insert_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/iterators_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/node_iterators.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/point_iterators.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/policy_access_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/rotate_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/r_erase_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/split_join_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_/traits.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/bin_search_tree_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/branch_policy/branch_policy.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/branch_policy/null_node_metadata.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/branch_policy/traits.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/branch_policy"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/cc_ht_map_.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/cmp_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/cond_key_dtor_entry_dealtor.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/constructor_destructor_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/constructor_destructor_no_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/constructor_destructor_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/debug_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/debug_no_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/debug_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/entry_list_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/erase_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/erase_no_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/erase_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/find_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/find_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/info_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/insert_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/insert_no_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/insert_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/iterators_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/policy_access_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/resize_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/resize_no_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/resize_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/size_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_/trace_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/cc_hash_table_map_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/eq_fn/eq_by_less.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/eq_fn/hash_eq_fn.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/eq_fn"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/constructor_destructor_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/constructor_destructor_no_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/constructor_destructor_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/debug_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/debug_no_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/debug_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/erase_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/erase_no_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/erase_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/find_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/find_no_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/find_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/gp_ht_map_.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/info_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/insert_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/insert_no_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/insert_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/iterator_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/policy_access_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/resize_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/resize_no_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/resize_store_hash_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_/trace_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/gp_hash_table_map_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/direct_mask_range_hashing_imp.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/direct_mod_range_hashing_imp.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/linear_probe_fn_imp.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/mask_based_range_hashing.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/mod_based_range_hashing.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/probe_fn_base.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/quadratic_probe_fn_imp.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/ranged_hash_fn.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/ranged_probe_fn.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/sample_probe_fn.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/sample_ranged_hash_fn.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/sample_ranged_probe_fn.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn/sample_range_hashing.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/hash_fn"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/constructors_destructor_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/const_iterator.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/debug_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/erase_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/info_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/insert_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/iterators_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/left_child_next_sibling_heap_.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/node.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/point_const_iterator.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/policy_access_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_/trace_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/left_child_next_sibling_heap_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/constructor_destructor_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/debug_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/entry_metadata_base.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/erase_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/find_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/info_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/insert_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/iterators_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/lu_map_.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_/trace_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_map_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_policy/lu_counter_metadata.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_policy/sample_update_policy.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/list_update_policy"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/constructors_destructor_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/debug_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/erase_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/info_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/insert_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/iterators_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/node_iterators.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/ov_tree_map_.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/policy_access_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/split_join_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_/traits.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/ov_tree_map_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pairing_heap_/constructors_destructor_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pairing_heap_/debug_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pairing_heap_/erase_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pairing_heap_/find_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pairing_heap_/insert_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pairing_heap_/pairing_heap_.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pairing_heap_/split_join_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pairing_heap_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/constructors_destructor_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/debug_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/erase_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/find_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/info_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/insert_join_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/iterators_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/pat_trie_.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/pat_trie_base.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/policy_access_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/rotate_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/r_erase_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/split_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/synth_access_traits.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/trace_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/traits.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_/update_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/pat_trie_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/constructors_destructor_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/debug_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/erase_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/find_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/info_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/insert_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/node.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/rb_tree_.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/split_join_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_/traits.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rb_tree_map_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_/constructors_destructor_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_/debug_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_/erase_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_/insert_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_/rc.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_/rc_binomial_heap_.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_/split_join_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_/trace_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/rc_binomial_heap_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/cc_hash_max_collision_check_resize_trigger_imp.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/hash_exponential_size_policy_imp.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/hash_load_check_resize_trigger_imp.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/hash_load_check_resize_trigger_size_base.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/hash_prime_size_policy_imp.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/hash_standard_resize_policy_imp.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/sample_resize_policy.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/sample_resize_trigger.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy/sample_size_policy.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/resize_policy"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/constructors_destructor_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/debug_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/erase_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/find_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/info_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/insert_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/node.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/splay_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/splay_tree_.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/split_join_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_/traits.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/splay_tree_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_/constructors_destructor_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_/debug_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_/erase_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_/find_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_/insert_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_/split_join_fn_imps.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_/thin_heap_.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_/trace_fn_imps.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/thin_heap_"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/tree_policy/node_metadata_selector.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/tree_policy/order_statistics_imp.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/tree_policy/sample_tree_node_update.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/tree_policy"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/trie_policy/node_metadata_selector.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/trie_policy/order_statistics_imp.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/trie_policy/prefix_search_node_update_imp.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/trie_policy/sample_trie_access_traits.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/trie_policy/sample_trie_node_update.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/trie_policy/trie_policy_base.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/trie_policy/trie_string_access_traits_imp.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/trie_policy"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/unordered_iterator/const_iterator.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/unordered_iterator/iterator.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/unordered_iterator/point_const_iterator.hpp tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/unordered_iterator/point_iterator.hpp "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/ext/pb_ds/detail/unordered_iterator"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/algo.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/algobase.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/algorithm tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/algorithmfwd.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/balanced_quicksort.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/base.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/basic_iterator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/checkers.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/compatibility.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/compiletime_settings.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/equally_split.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/features.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/find.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/find_selectors.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/for_each.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/for_each_selectors.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/iterator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/list_partition.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/losertree.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/merge.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/multiseq_selection.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/multiway_merge.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/multiway_mergesort.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/numeric tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/numericfwd.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/omp_loop.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/omp_loop_static.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/parallel.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/partial_sum.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/partition.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/par_loop.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/queue.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/quicksort.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/random_number.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/random_shuffle.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/search.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/settings.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/set_operations.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/sort.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/tags.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/types.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/unique_copy.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel/workstealing.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/parallel"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/array tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/base.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/bitset tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/deque tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/forward_list tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/iterator_tracker.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/list tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/map tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/map.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/multimap.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/multiset.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/ordered_base.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/set tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/set.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/unordered_base.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/unordered_map tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/unordered_set tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/vector "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_algos.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_container_size.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_hashtable_size.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_hash_func.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_list_to_slist.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_list_to_vector.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_map_to_unordered_map.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_node.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_state.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_trace.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_vector_size.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl/profiler_vector_to_list.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/profile/impl"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/array tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/bessel_function.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/beta_function.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/ccomplex tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cctype tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cfenv tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cfloat tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cinttypes tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/climits tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cmath "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/complex tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/complex.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cstdarg tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cstdbool tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cstdint tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cstdio tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cstdlib tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/ctgmath tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/ctime tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/ctype.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cwchar tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/cwctype tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/ell_integral.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/exp_integral.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/fenv.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/float.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/functional tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/functional_hash.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/gamma.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/hashtable.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/hashtable_policy.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/hypergeometric.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/inttypes.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/legendre_function.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/limits.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/math.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/memory tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/modified_bessel_func.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/poly_hermite.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/poly_laguerre.tcc "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/random tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/random.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/random.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/regex tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/riemann_zeta.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/shared_ptr.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/special_function_util.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/stdarg.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/stdbool.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/stdint.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/stdio.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/stdlib.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/tgmath.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/tuple tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/type_traits tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/unordered_map tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/unordered_map.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/unordered_set tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/unordered_set.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/utility "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/wchar.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1/wctype.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr1"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr2/bool_set tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr2/bool_set.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr2/dynamic_bitset tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr2/dynamic_bitset.tcc tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr2/ratio tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr2/type_traits "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/tr2"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/atomic_word.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/basic_file.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/c++allocator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/c++config.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/c++io.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/c++locale.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/cpu_defines.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/ctype_base.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/ctype_inline.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/cxxabi_tweaks.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/error_constants.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/extc++.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/gthr-default.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/gthr-posix.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/gthr-single.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/gthr.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/messages_members.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/opt_random.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/os_defines.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/stdc++.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/stdtr1c++.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits/time_members.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/ext/opt_random.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/32/ext"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/atomic_word.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/basic_file.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/c++allocator.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/c++config.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/c++io.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/c++locale.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/cpu_defines.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/ctype_base.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/ctype_inline.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/cxxabi_tweaks.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/error_constants.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/extc++.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/gthr-default.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/gthr-posix.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/gthr-single.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/gthr.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/messages_members.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/opt_random.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/os_defines.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/stdc++.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/stdtr1c++.h tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits/time_members.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/bits"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/ext/opt_random.h "tdm/gcc/c++/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++/x86_64-w64-mingw32/ext"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/libexec/gcc/x86_64-w64-mingw32/5.1.0/cc1plus.exe "tdm/gcc/c++/libexec/gcc/x86_64-w64-mingw32/5.1.0"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/licenses/COPYING.ISL.txt tdm/gcc-5.1.0-tdm64-1-c++/licenses/COPYING.RUNTIME-gcc-tdm.txt tdm/gcc-5.1.0-tdm64-1-c++/licenses/COPYING.winpthreads.txt tdm/gcc-5.1.0-tdm64-1-c++/licenses/COPYING3-gcc-tdm.txt tdm/gcc-5.1.0-tdm64-1-c++/licenses/COPYING3.LIB-gcc-tdm.txt "tdm/gcc/c++/licenses"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/share/gcc-5.1.0/python/libstdcxx/__init__.py "tdm/gcc/c++/share/gcc-5.1.0/python/libstdcxx"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/share/gcc-5.1.0/python/libstdcxx/v6/printers.py tdm/gcc-5.1.0-tdm64-1-c++/share/gcc-5.1.0/python/libstdcxx/v6/xmethods.py tdm/gcc-5.1.0-tdm64-1-c++/share/gcc-5.1.0/python/libstdcxx/v6/__init__.py "tdm/gcc/c++/share/gcc-5.1.0/python/libstdcxx/v6"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/share/man/man1/g++.1 "tdm/gcc/c++/share/man/man1"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/make-3.82.90/bin/mingw32-make.exe "tdm/make/bin"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/make-3.82.90/licenses/COPYING "tdm/make/licenses"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/libgnurx-2.7/bin/gnurx-0.dll "tdm/gnurx/bin"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/libgnurx-2.7/include/regex.h "tdm/gnurx/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/libgnurx-2.5.1-32/bin/libgnurx-0.dll "tdm/gnurx32/bin"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/libgnurx-2.7/include/regex.h "tdm/gnurx32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/binutils-2.25-tdm64-1/share/info/as.info tdm/binutils-2.25-tdm64-1/share/info/bfd.info tdm/binutils-2.25-tdm64-1/share/info/binutils.info tdm/binutils-2.25-tdm64-1/share/info/gprof.info tdm/binutils-2.25-tdm64-1/share/info/ld.info "tdm/doc/binutils/info"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/binutils-2.25-tdm64-1/share/man/man1/addr2line.1 tdm/binutils-2.25-tdm64-1/share/man/man1/ar.1 tdm/binutils-2.25-tdm64-1/share/man/man1/as.1 tdm/binutils-2.25-tdm64-1/share/man/man1/c++filt.1 tdm/binutils-2.25-tdm64-1/share/man/man1/dlltool.1 tdm/binutils-2.25-tdm64-1/share/man/man1/elfedit.1 tdm/binutils-2.25-tdm64-1/share/man/man1/gprof.1 tdm/binutils-2.25-tdm64-1/share/man/man1/ld.1 tdm/binutils-2.25-tdm64-1/share/man/man1/nlmconv.1 tdm/binutils-2.25-tdm64-1/share/man/man1/nm.1 "tdm/doc/binutils/man"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/binutils-2.25-tdm64-1/share/man/man1/objcopy.1 tdm/binutils-2.25-tdm64-1/share/man/man1/objdump.1 tdm/binutils-2.25-tdm64-1/share/man/man1/ranlib.1 tdm/binutils-2.25-tdm64-1/share/man/man1/readelf.1 tdm/binutils-2.25-tdm64-1/share/man/man1/size.1 tdm/binutils-2.25-tdm64-1/share/man/man1/strings.1 tdm/binutils-2.25-tdm64-1/share/man/man1/strip.1 tdm/binutils-2.25-tdm64-1/share/man/man1/windmc.1 tdm/binutils-2.25-tdm64-1/share/man/man1/windres.1 "tdm/doc/binutils/man"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/doc/binutils/man/man1/addr2line.1 tdm/doc/binutils/man/man1/ar.1 tdm/doc/binutils/man/man1/as.1 tdm/doc/binutils/man/man1/c++filt.1 tdm/doc/binutils/man/man1/dlltool.1 tdm/doc/binutils/man/man1/elfedit.1 tdm/doc/binutils/man/man1/gprof.1 tdm/doc/binutils/man/man1/ld.1 tdm/doc/binutils/man/man1/nlmconv.1 tdm/doc/binutils/man/man1/nm.1 "tdm/doc/binutils/man/man1"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/doc/binutils/man/man1/objcopy.1 tdm/doc/binutils/man/man1/objdump.1 tdm/doc/binutils/man/man1/ranlib.1 tdm/doc/binutils/man/man1/readelf.1 tdm/doc/binutils/man/man1/size.1 tdm/doc/binutils/man/man1/strings.1 tdm/doc/binutils/man/man1/strip.1 tdm/doc/binutils/man/man1/windmc.1 tdm/doc/binutils/man/man1/windres.1 "tdm/doc/binutils/man/man1"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-c++/share/man/man1/g++.1 "tdm/doc/g++/man/man1"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/share/info/cpp.info tdm/gcc-5.1.0-tdm64-1-core/share/info/cppinternals.info tdm/gcc-5.1.0-tdm64-1-core/share/info/gcc.info tdm/gcc-5.1.0-tdm64-1-core/share/info/gccinstall.info tdm/gcc-5.1.0-tdm64-1-core/share/info/gccint.info tdm/gcc-5.1.0-tdm64-1-core/share/info/libquadmath.info "tdm/doc/gcc/info"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/share/man/man1/cpp.1 tdm/gcc-5.1.0-tdm64-1-core/share/man/man1/gcc.1 tdm/gcc-5.1.0-tdm64-1-core/share/man/man1/gcov.1 "tdm/doc/gcc/man/man1"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/gcc-5.1.0-tdm64-1-core/share/man/man7/fsf-funding.7 tdm/gcc-5.1.0-tdm64-1-core/share/man/man7/gfdl.7 tdm/gcc-5.1.0-tdm64-1-core/share/man/man7/gpl.7 "tdm/doc/gcc/man/man7"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/doc/gdb/info/gdb.info "tdm/doc/gdb/info"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/doc/gdb/man/gdb.1 "tdm/doc/gdb/man"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/doc/gnurx/info/regex.info "tdm/doc/gnurx/info"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/doc/gnurx/man/man3/regcomp.3 tdm/doc/gnurx/man/man3/regerror.3 tdm/doc/gnurx/man/man3/regex.3 tdm/doc/gnurx/man/man3/regexec.3 tdm/doc/gnurx/man/man3/regfree.3 "tdm/doc/gnurx/man/man3"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/doc/make/info/make.info tdm/doc/make/info/make.info-1 tdm/doc/make/info/make.info-2 "tdm/doc/make/info"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/doc/make/man/man1/mingw32-make.1 "tdm/doc/make/man/man1"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/licenses/COPYING.LIB.txt tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/licenses/COPYING.MinGW-w64-runtime.txt tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/licenses/COPYING.MinGW-w64.txt tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/licenses/COPYING.winpthreads.txt "tdm/mingwrt/licenses"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/bin/gendef.exe tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/bin/genidl.exe "tdm/mingwrt/x86_64-w64-mingw32/bin"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/accctrl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/aclapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/aclui.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/activation.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/activaut.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/activdbg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/activdbg100.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/activecf.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/activeds.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/activprof.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/activscp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adhoc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/admex.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adoctint.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adodef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adogpool.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adogpool_backcompat.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adoguids.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adoid.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adoint.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adoint_backcompat.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adojet.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adomd.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adptif.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adsdb.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adserr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adshlp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adsiid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adsnms.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adsprop.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adssts.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/adtgen.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/advpub.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/afxres.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/af_irda.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/agtctl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/agtctl_i.c tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/agterr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/agtsvr.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/agtsvr_i.c tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/alg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/alink.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/amaudio.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/amstream.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/amstream.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/amvideo.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/amvideo.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/apdevpkey.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/apiset.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/apisetcconv.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/appmgmt.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/aqadmtyp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/asptlb.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/assert.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/atacct.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/atalkwsh.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/atsmedia.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/audevcod.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/audioapotypes.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/audioclient.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/audioendpoints.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/audioengineendpoint.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/audiopolicy.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/audiosessiontypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/austream.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/austream.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/authif.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/authz.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/aux_ulib.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/avifmt.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/aviriff.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/avrfsdk.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/avrt.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/axextendenums.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/azroles.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/basetsd.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/basetyps.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/batclass.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bcrypt.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bdaiface.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bdamedia.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bdatypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bemapiset.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bh.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bidispl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bits.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bits1_5.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bits2_0.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bitscfg.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bitsmsg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/blberr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bluetoothapis.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bthdef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bthsdpdef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/bugcodes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/callobj.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cardmod.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/casetup.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cchannel.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cderr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdoex.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdoexerr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdoexm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdoexm_i.c tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdoexstr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdoex_i.c tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdonts.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdosys.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdosyserr.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdosysstr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cdosys_i.c tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/celib.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certadm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certbase.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certbcli.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certcli.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certenc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certenroll.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certexit.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certif.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certmod.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certpol.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certreqd.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certsrv.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/certview.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cfg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cfgmgr32.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cguid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/chanmgr.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cierror.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/clfs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/clfsmgmt.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/clfsmgmtw32.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/clfsw32.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cluadmex.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/clusapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cluscfgguids.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cluscfgserver.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cluscfgwizard.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cmdtree.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cmnquery.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/codecapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/color.dlg tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/colordlg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/comadmin.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/combaseapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/comcat.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/comdef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/comdefsp.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/comip.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/comlite.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/commapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/commctrl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/commctrl.rh tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/commdlg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/common.ver tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/commoncontrols.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/complex.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/compobj.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/compressapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/compstui.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/comsvcs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/comutil.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/confpriv.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/conio.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/control.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cor.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/corerror.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/corhdr.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/correg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cpl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cplext.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/credssp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/crtdbg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/crtdefs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cryptuiapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cryptxml.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cscapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/cscobj.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ctfutb.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ctxtcall.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ctype.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/custcntl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2d1.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2d1effectauthor.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2d1effecthelpers.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2d1effects.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2d1helper.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2d1_1.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2d1_1helper.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2dbasetypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d2derr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d10.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d10.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d10effect.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d10misc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d10shader.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d10_1.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d10_1.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d10_1shader.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d11.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d11.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d11sdklayers.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d11sdklayers.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d11shader.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d11_1.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d11_1.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d8.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d8caps.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d8types.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d9.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d9caps.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3d9types.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dcaps.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dcommon.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dcommon.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dcompiler.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dhal.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3drm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3drmdef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3drmobj.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dtypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dvec.inl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9anim.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9core.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9effect.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9math.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9math.inl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9mesh.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9shader.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9shape.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9tex.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/d3dx9xof.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/daogetrw.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/datapath.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/datetimeapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/davclnt.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dbdaoerr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dbdaoid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dbdaoint.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dbgautoattach.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dbgeng.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dbghelp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dbgprop.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dbt.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dciddi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dciman.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dcommon.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dde.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dde.rh tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddeml.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddraw.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddrawgdi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddrawi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddstream.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddstream.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/debugapi.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/delayimp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/devguid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/devicetopology.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/devioctl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/devpkey.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/devpropdef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dhcpcsdk.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dhcpsapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dhcpssdk.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dhcpv6csdk.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dhtmldid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dhtmled.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dhtmliid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/digitalv.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dimm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dinput.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dir.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/direct.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dirent.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/diskguid.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dispatch.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dispdib.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dispex.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dlcapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dlgs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dls1.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dls2.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmdls.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmemmgr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmerror.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmksctrl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmo.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmodshow.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmodshow.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmoreg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmort.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmplugin.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmusbuff.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmusicc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmusicf.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmusici.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dmusics.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/docobj.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/docobjectservice.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/documenttarget.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/domdid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dos.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/downloadmgr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dpaddr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dpapi.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dpfilter.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dplay.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dplay8.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dplobby.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dplobby8.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dpnathlp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/driverspecs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dsadmin.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dsclient.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dsconf.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dsdriver.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dsgetdc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dshow.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dskquota.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dsound.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dsquery.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dsrole.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dssec.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dtchelp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dvbsiparser.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dvdevcod.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dvdmedia.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dvec.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dvobj.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dwmapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dwrite.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dwrite_1.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxdiag.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxerr8.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxerr9.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxfile.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxgi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxgi.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxgi1_2.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxgi1_2.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxgiformat.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxgitype.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxtmpl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxva.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxva2api.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/dxvahd.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eapauthenticatoractiondefine.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eapauthenticatortypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eaphosterror.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eaphostpeerconfigapis.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eaphostpeertypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eapmethodauthenticatorapis.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eapmethodpeerapis.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eapmethodtypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eappapis.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eaptypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/edevdefs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eh.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ehstorapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/elscore.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/emostore.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/emostore_i.c tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/emptyvc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/endpointvolume.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/errhandlingapi.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/errno.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/error.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/errorrep.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/errors.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/esent.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/evcode.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/evcoll.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/eventsys.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/evntcons.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/evntprov.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/evntrace.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/evr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/evr9.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/exchform.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/excpt.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/exdisp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/exdispid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fci.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fcntl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fdi.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fenv.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fibersapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fileapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fileextd.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/filehc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fileopen.dlg tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/filter.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/filterr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/findtext.dlg tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/float.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fltdefs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fltuser.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fltuserstructures.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fltwinerror.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/font.dlg tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fpieee.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fsrm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fsrmenums.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fsrmerr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fsrmpipeline.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fsrmquota.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fsrmreports.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fsrmscreen.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ftsiface.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ftw.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/functiondiscoveryapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/functiondiscoverycategories.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/functiondiscoveryconstraints.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/functiondiscoverykeys.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/functiondiscoverykeys_devpkey.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/functiondiscoverynotification.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fusion.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fvec.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fwpmtypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fwpmu.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/fwptypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gb18030.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/getopt.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gpedit.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gpio.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gpmgmt.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/guiddef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/h323priv.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/handleapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/heapapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hidclass.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hidpi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hidsdi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hidusage.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/highlevelmonitorconfigurationapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hlguids.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hliface.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hlink.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hostinfo.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/hstring.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/htiface.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/htiframe.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/htmlguid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/htmlhelp.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/http.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/httpext.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/httpfilt.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/httprequestid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ia64reg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iaccess.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iadmext.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iadmw.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iads.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/icftypes.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/icm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/icmpapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/icmui.dlg tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/icodecapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/icrsint.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/identitycommon.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/identitystore.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/idf.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/idispids.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iedial.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ieeefp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ieverp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ifdef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iiis.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iiisext.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iimgctx.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iiscnfg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iisext_i.c tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iisrsta.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iketypes.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ilogobj.hxx tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/imagehlp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ime.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/imessage.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/imm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/in6addr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/inaddr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/indexsrv.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/inetreg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/inetsdk.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/initguid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/initoid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/inputscope.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/inspectable.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/interlockedapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/intrin.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/intshcut.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/inttypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/invkprxy.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/io.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ioapiset.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ioevent.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipexport.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iphlpapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipifcons.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipinfoid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipmib.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipmsp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iprtrmib.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipsectypes.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iptypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipxconst.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipxrip.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipxrtdef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipxsap.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ipxtfflt.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iscsidsc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/isguids.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/issper16.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/issperr.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/isysmon.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ivec.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/iwamreg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/i_cryptasn1tls.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/jobapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/kcom.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/knownfolders.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ks.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ksdebug.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ksguid.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ksmedia.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ksproxy.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ksuuids.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ktmtypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ktmw32.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/kxia64.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/l2cmn.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/libgen.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/libloaderapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/libmangle.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/limits.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmaccess.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmalert.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmapibuf.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmat.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmaudit.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmconfig.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmcons.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmdfs.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmerr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmerrlog.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmjoin.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmmsg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmon.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmremutl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmrepl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmserver.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmshare.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmsname.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmstats.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmsvc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmuse.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmuseflg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lmwksta.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/loadperf.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/locale.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/locationapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lpmapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/lzexpand.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/madcapcl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mailmsgprops.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/malloc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/manipulations.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapicode.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapidbg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapidefs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapiform.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapiguid.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapihook.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapinls.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapioid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapispi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapitags.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapiutil.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapival.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapiwin.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapiwz.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mapix.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/math.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mbctype.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mbstring.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mciavi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mcx.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mdbrole.hxx tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mdcommsg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mddefw.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mdhcp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mdmsg.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mediaerr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mediaobj.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mediaobj.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/medparam.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/medparam.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mem.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/memory.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/memoryapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mergemod.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mfapi.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mferror.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mfidl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mfmp2dlna.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mfobjects.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mfplay.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mfreadwrite.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mftransform.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mgm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mgmtapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/midles.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mimedisp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mimeinfo.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/minmax.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/minwinbase.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/minwindef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mlang.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mmc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mmcobj.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mmdeviceapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mmreg.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mmstream.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mmstream.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mmsystem.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mobsync.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/moniker.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mpeg2bits.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mpeg2data.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mpeg2psiparser.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mpeg2structs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mprapi.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mprerror.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mq.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mqmail.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mqoai.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msacm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msacmdlg.dlg tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msacmdlg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msado15.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msasn1.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msber.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mscat.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mschapp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msclus.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mscoree.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msctf.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msctfmonitorapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdadc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdaguid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdaipp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdaipper.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdaora.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdaosp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdasc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdasql.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdatsrc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdrm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdrmdefs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msdshape.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msfs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mshtmcid.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mshtmdid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mshtmhst.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mshtml.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mshtmlc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msidefs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msimcntl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msimcsdk.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msiquery.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msoav.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msopc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspab.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspaddr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspbase.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspcall.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspcoll.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspenum.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msplog.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspst.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspstrm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspterm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mspthrd.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msptrmac.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msptrmar.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msptrmvc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msputils.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msrdc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msremote.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mssip.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msstkppg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mstask.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mstcpip.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msterr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mswsock.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msxml.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msxml2.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msxml2did.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/msxmldid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtsadmin.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtsadmin_i.c tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtsevents.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtsgrp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtx.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtxadmin.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtxadmin_i.c tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtxattr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mtxdm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/muiload.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/multimon.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/multinfo.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/mxdc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/namedpipeapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/namespaceapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napcertrelyingparty.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napcommon.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napenforcementclient.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napmanagement.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napmicrosoftvendorids.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napprotocol.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napservermanagement.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napsystemhealthagent.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/napsystemhealthvalidator.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/naptypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/naputil.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/nb30.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ncrypt.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ndattrib.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ndfapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ndhelper.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ndkinfo.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ndr64types.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ndrtypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/netcon.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/neterr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/netevent.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/netioapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/netlistmgr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/netmon.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/netprov.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/nettypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/new.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/newapis.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/newdev.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/nldef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/nmsupp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/npapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/nsemail.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/nspapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntdd1394.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntdd8042.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddbeep.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddcdrm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddcdvd.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddchgr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntdddisk.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddft.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddkbd.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddmmc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddmodm.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddmou.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddndis.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddpar.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddpsch.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddscsi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddser.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddstor.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddtape.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddtdi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddvdeo.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntddvol.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntdef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntdsapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntdsbcli.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntdsbmsg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntgdi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntiologc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntldap.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntmsapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntmsmli.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntquery.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntsdexts.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntsecapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntsecpkg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntstatus.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ntverp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oaidl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/objbase.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/objectarray.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/objerror.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/objidl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/objidlbase.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/objsafe.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/objsel.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ocidl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ocmm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/odbcinst.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/odbcss.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ole.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ole2.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ole2ver.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oleacc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oleauto.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/olectl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/olectlid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oledb.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oledbdep.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oledberr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oledbguid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oledlg.dlg "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oledlg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oleidl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/oletx2xa.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/opmapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/optary.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/p2p.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/packoff.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/packon.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/parser.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/patchapi.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/patchwiz.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pathcch.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pbt.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pchannel.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pciprop.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pcrt32.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pdh.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pdhmsg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/penwin.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/perflib.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/perhist.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/persist.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pgobootrun.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/physicalmonitorenumerationapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pla.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pnrpdef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pnrpns.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/poclass.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/polarity.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/poppack.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/portabledeviceconnectapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/portabledevicetypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/powrprof.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/prnasnot.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/prnsetup.dlg tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/prntfont.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/process.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/processenv.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/processthreadsapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/processtopologyapi.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/profile.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/profileapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/profinfo.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/propidl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/propkey.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/propkeydef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/propsys.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/propvarutil.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/prsht.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psapi.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pshpack1.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pshpack2.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pshpack4.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pshpack8.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pshpck16.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/pstore.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qedit.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qedit.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qmgr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qnetwork.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qnetwork.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qos.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qos2.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qosname.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qospol.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/qossp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ras.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rasdlg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/raseapif.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/raserror.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rassapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rasshost.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ratings.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rdpencomapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/realtimeapiset.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/reason.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/recguids.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/reconcil.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/regstr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rend.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/resapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/restartmanager.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/richedit.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/richole.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rkeysvcc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rnderr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/roapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/routprot.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcasync.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcdce.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcdcep.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcndr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcnsi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcnsip.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcnterr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcproxy.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcsal.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rpcssl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rrascfg.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rtcapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rtccore.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rtcerr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rtinfo.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rtm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rtmv2.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/rtutils.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sal.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sapi51.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sapi53.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sapi54.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sas.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sbe.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scarddat.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scarderr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scardmgr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scardsrv.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scardssp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scardssp_i.c "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scardssp_p.c tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scesvc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/schannel.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/schedule.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/schemadef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/schnlsp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scode.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scrnsave.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/scrptids.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sddl.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sdkddkver.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sdoias.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sdpblb.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sdperr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/search.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/secext.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/security.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/securityappcontainer.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/securitybaseapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sehmap.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sens.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sensapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sensevts.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sensors.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sensorsapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/servprov.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/setjmp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/setjmpex.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/setupapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sfc.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shappmgr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/share.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shdeprecated.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shdispid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shellapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sherrors.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shfolder.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shldisp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shlguid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shlobj.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shlwapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shobjidl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/shtypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/signal.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/simpdata.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/simpdc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sipbase.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sisbkup.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/slerror.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/slpublic.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/smpab.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/smpms.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/smpxp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/smtpguid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/smx.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/snmp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/softpub.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/specstrings.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sporder.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sql.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sqlext.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sqloledb.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sqltypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sqlucode.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sql_1.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/srrestoreptapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/srv.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sspguid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sspi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sspserr.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sspsidl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stdarg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stddef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stdexcpt.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stdint.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stdio.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stdlib.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sti.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stierr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stireg.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stllock.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/storage.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/storduid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/storprop.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stralign.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/string.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/stringapiset.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/strings.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/strmif.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/strsafe.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/structuredquerycondition.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/subauth.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/subsmgr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/svcguid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/svrapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/swprintf.inl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/synchapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sysinfoapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/syslimits.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/systemtopologyapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/t2embapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tabflicks.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tapi3.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tapi3cc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tapi3ds.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tapi3err.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tapi3if.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/taskschd.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tbs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tcerror.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tcguid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tchar.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tcpestats.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tcpmib.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tdh.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tdi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tdiinfo.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/termmgr.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/textserv.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/textstor.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/threadpoolapiset.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/threadpoollegacyapiset.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/time.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/timeprov.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/timezoneapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tlbref.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tlhelp32.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tlogstg.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tmschema.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tnef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tom.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tpcshrd.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/traffic.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/transact.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/triedcid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/triediid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/triedit.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tsattrs.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tspi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tssbx.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tsuserex.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tsuserex_i.c tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tuner.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/tvout.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/txcoord.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/txctx.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/txdtc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/txfw32.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/typeinfo.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/uastrfnc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/uchar.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/udpmib.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/uiautomation.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/uiautomationclient.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/uiautomationcore.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/uiautomationcoreapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/umx.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/unistd.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/unknown.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/unknwn.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/unknwnbase.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/urlhist.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/urlmon.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usb.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usb100.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usb200.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbcamdi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbdi.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbioctl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbiodef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbprint.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbrpmif.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbscan.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbspec.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usbuser.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/userenv.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/usp10.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/utilapiset.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/utime.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/uuids.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/uxtheme.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vadefs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/varargs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vcr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vdmdbg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vds.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vdslun.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/verinfo.ver "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vfw.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vfwmsgs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/virtdisk.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vmr9.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vmr9.idl tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vsadmin.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vsbackup.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vsmgmt.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vsprov.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vss.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vsstyle.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vssym32.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/vswriter.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/w32api.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wab.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wabapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wabcode.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wabdefs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wabiab.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wabmem.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wabnot.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wabtags.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wabutil.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wbemads.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wbemcli.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wbemdisp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wbemidl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wbemprov.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wbemtran.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wchar.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wcmconfig.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wcsplugin.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wct.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wctype.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wdsbp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wdsclientapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wdspxe.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wdstci.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wdstpdi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wdstptmgmt.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/werapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wfext.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wia.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wiadef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wiadevd.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wiavideo.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winable.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winapifamily.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winbase.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winber.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wincodec.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wincon.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wincred.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wincrypt.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winddi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winddiui.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windns.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windot11.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windows.foundation.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windows.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windows.security.cryptography.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windows.storage.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windows.storage.streams.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windows.system.threading.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windowsx.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/windowsx.h16 tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winefs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winerror.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winevt.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wingdi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winhttp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wininet.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winineti.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winioctl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winldap.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winnetwk.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winnls.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winnls32.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winnt.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winnt.rh tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winperf.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winreg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winresrc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsafer.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsatcominterfacei.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winscard.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsdkver.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsmcrd.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsnmp.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsock.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsock2.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsplp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winspool.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winstring.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsvc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsxs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winsync.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winternl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wintrust.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winusb.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winusbio.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winuser.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winuser.rh tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winver.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/winwlx.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wlanapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wlanihvtypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wlantypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wmcodecdsp.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wmcontainer.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wmiatlprov.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wmistr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wmiutils.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wmsbuffer.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wmsdkidl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wnnc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wow64apiset.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wownt16.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wownt32.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wpapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wpapimsg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wpcapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wpcevent.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wpcrsmsg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wpftpmsg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wppstmsg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wpspihlp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wptypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wpwizmsg.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ws2atm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ws2bth.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ws2def.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ws2dnet.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ws2ipdef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ws2spi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ws2tcpip.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdattachment.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdbase.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdclient.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsddisco.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdhost.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdtypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdutil.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdxml.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsdxmldom.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wshisotp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsipv6ok.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsipx.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsman.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsmandisp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsnetbs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsnwlink.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wspiapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsrm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wsvns.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wtsapi32.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wtypes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/wtypesbase.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xa.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xcmc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xcmcext.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xcmcmsx2.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xcmcmsxt.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xenroll.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xinput.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xlocinfo.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xmath.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xmldomdid.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xmldsodid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xmllite.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xmltrnsf.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xolehlp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xpsdigitalsignature.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xpsobjectmodel.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xpsobjectmodel_1.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xpsprint.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/xpsrassvc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ymath.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/yvals.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/zmouse.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_bsd_types.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_cygwin.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_dbdao.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_dxhelper.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_mac.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_off_t.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_print_pop.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_print_push.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_secapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_stat64.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_stdarg.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_mingw_unicode.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/_timeval.h "tdm/mingwrt/x86_64-w64-mingw32/include"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/acpiioct.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/afilter.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/amtvuids.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/atm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/bdasup.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/classpnp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/csq.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/d3dhal.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/d3dhalex.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/d4drvif.h "tdm/mingwrt/x86_64-w64-mingw32/include/ddk"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/d4iface.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/dderror.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/dmusicks.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/drivinit.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/drmk.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/dxapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/fltsafe.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/hidclass.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/hubbusif.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ide.h "tdm/mingwrt/x86_64-w64-mingw32/include/ddk"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ioaccess.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/kbdmou.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/mcd.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/mce.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/miniport.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/minitape.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/mountdev.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/mountmgr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/msports.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ndis.h "tdm/mingwrt/x86_64-w64-mingw32/include/ddk"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ndisguid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ndistapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ndiswan.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/netpnp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntagp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntddk.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntddpcm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntddsnd.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntifs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntimage.h "tdm/mingwrt/x86_64-w64-mingw32/include/ddk"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntnls.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntpoapi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ntstrsafe.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/oprghdlr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/parallel.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/pfhook.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/poclass.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/portcls.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/punknown.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/scsi.h "tdm/mingwrt/x86_64-w64-mingw32/include/ddk"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/scsiscan.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/scsiwmi.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/smbus.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/srb.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/stdunk.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/storport.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/strmini.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/swenum.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/tdikrnl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/tdistat.h "tdm/mingwrt/x86_64-w64-mingw32/include/ddk"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/upssvc.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/usbbusif.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/usbdlib.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/usbdrivr.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/usbkern.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/usbprint.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/usbprotocoldefs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/usbscan.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/usbstorioctl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/video.h "tdm/mingwrt/x86_64-w64-mingw32/include/ddk"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/videoagp.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/wdm.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/wdmguid.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/wmidata.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/wmilib.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/ws2san.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/ddk/xfilter.h "tdm/mingwrt/x86_64-w64-mingw32/include/ddk"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplus.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusbase.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusbrush.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdipluscolor.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdipluscolormatrix.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdipluseffects.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusenums.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusflat.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusgpstubs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusgraphics.h "tdm/mingwrt/x86_64-w64-mingw32/include/gdiplus"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusheaders.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusimageattributes.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusimagecodec.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusimaging.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusimpl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusinit.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdipluslinecaps.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusmatrix.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusmem.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusmetafile.h "tdm/mingwrt/x86_64-w64-mingw32/include/gdiplus"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusmetaheader.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdipluspath.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdipluspen.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdipluspixelformats.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplusstringformat.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/gdiplus/gdiplustypes.h "tdm/mingwrt/x86_64-w64-mingw32/include/gdiplus"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/GL/gl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/GL/glaux.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/GL/glcorearb.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/GL/glext.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/GL/glu.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/GL/glxext.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/GL/wglext.h "tdm/mingwrt/x86_64-w64-mingw32/include/GL"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/intrin-impl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_dbg_common.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_dbg_LOAD_IMAGE.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_fd_types.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_ip_mreq1.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_ip_types.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_pop_BOOL.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_push_BOOL.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_socket_types.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_varenum.h "tdm/mingwrt/x86_64-w64-mingw32/include/psdk_inc"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_ws1_undef.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_wsadata.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_wsa_errnos.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/psdk_inc/_xmitfile.h "tdm/mingwrt/x86_64-w64-mingw32/include/psdk_inc"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sdks/_mingw_ddk.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sdks/_mingw_directx.h "tdm/mingwrt/x86_64-w64-mingw32/include/sdks"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/conio_s.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/crtdbg_s.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/io_s.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/mbstring_s.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/memory_s.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/search_s.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/stdio_s.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/stdlib_s.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/stralign_s.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/string_s.h "tdm/mingwrt/x86_64-w64-mingw32/include/sec_api"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/tchar_s.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/wchar_s.h "tdm/mingwrt/x86_64-w64-mingw32/include/sec_api"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sec_api/sys/timeb_s.h "tdm/mingwrt/x86_64-w64-mingw32/include/sec_api/sys"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/cdefs.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/fcntl.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/file.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/locking.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/param.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/stat.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/time.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/timeb.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/types.h tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/unistd.h "tdm/mingwrt/x86_64-w64-mingw32/include/sys"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/include/sys/utime.h "tdm/mingwrt/x86_64-w64-mingw32/include/sys"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/binmode.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/crt1.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/crt1u.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/crt2.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/crt2u.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/crtbegin.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/crtend.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/CRT_fp10.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/CRT_fp8.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/CRT_glob.o "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/CRT_noglob.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/dllcrt1.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/dllcrt2.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/gcrt0.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/gcrt1.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/gcrt2.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/lib6to4svc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libaaaamon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libacledit.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libaclui.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libactiveds.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libactxprxy.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadmparse.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadmwprox.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadptif.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadrot.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadsiis.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadsiisex.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadsldp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadsldpc.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadsmsext.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadsnt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadvapi32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libadvpack.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libaelupsvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagentanm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagentctl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagentdp2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagentdpv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagentmpx.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagentpsh.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagentsr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagrmco64.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libagtintl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libakscoinst.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libalrsvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libamstream.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libapcups.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libapi-ms-win-core-winrt-l1-1-0.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libapi-ms-win-core-winrt-string-l1-1-0.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libapphelp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libappmgmts.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libappmgr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libaqadmin.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libaqueue.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libasp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libaspperf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libasycfilt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libatkctrs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libatl.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libatmlib.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libatmpvcno.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libatrace.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libaudiosrv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libauthz.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libautodisc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libavicap32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libavifil32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libavrt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libazroles.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libazroleui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbasesrv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbatmeter.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbatt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbcrypt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbidispl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbitsprx2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbitsprx3.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbnts.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbootvid.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbrowscap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbrowser.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbrowseui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbrpinfo.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbthci.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbthprops.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbthserv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libbtpanui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcabinet.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcabview.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcamocx.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcards.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcatsrv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcatsrvps.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcatsrvut.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libccfgnt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcdfview.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcdm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcdosys.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcertcli.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcertmgr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcertobj.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcfgbkend.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcfgmgr32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libchsbrkr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libchtbrkr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libchtskdic.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libciadmin.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcic.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcimwin32.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libCINTIME.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libciodm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libclasspnp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libclb.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libclbcatex.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libclbcatq.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libclfsw32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcliconfg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libclusapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcmcfg32.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcmdial32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcmpbk32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcmprops.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcmsetacl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcmutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcnbjmon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcnetcfg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcnvfat.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcoadmin.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcolbact.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomaddin.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomadmin.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomcat.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomctl32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomdlg32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcompatui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcompstui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomrepl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomres.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomsetup.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomsnap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomsvcs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcomuid.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libconfmsp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libconnect.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libconsole.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcontrot.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcorpol.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcredui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcrtdll.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcrypt32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcryptdlg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcryptdll.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcryptext.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcryptnet.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcryptsp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcryptsvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcryptui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcryptxml.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcscapi.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcscdll.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcscui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libcsrsrv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libc_g18030.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libc_is2022.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libc_iscii.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd2d1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3d11.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3d8thk.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3d9.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_33.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_34.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_35.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_36.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_37.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_38.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_39.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_40.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_41.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_42.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_43.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcompiler_46.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcsxd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcsxd_43.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dcsx_46.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_33.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_34.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_35.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_36.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_37.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_38.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_39.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_40.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_41.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_42.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx10_43.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx11.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx11_42.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx11_43.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_24.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_25.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_26.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_27.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_28.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_29.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_30.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_31.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_33.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_34.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_35.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_36.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_37.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_38.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_39.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_40.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_41.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_42.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dx9_43.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libd3dxof.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdanim.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdataclen.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdatime.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdavclnt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdavcprox.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdbgeng.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdbghelp.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdbnetlib.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdbnmpntw.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdciman32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libddraw.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libddrawex.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdelayimp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdeskadp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdeskmon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdeskperf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdevenum.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdevmgr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdevobj.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdevrtl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdfrgifps.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdfrgsnap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdfrgui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdfsshlex.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdgnet.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdhcpcsvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdhcpcsvc6.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdhcpmon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdhcpsapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdiactfrm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdigest.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdimap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdimsntfy.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdimsroam.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdinput.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdinput8.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdirectdb.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdiskcopy.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdispex.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmconfig.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmdlgs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmdskmgr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmintf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmivcitf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmocx.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmoguids.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmserver.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdmvdsitf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdnsapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdnsrslvr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdocprop.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdocprop2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdpnaddr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdpnet.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdpnhpast.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdpnhupnp.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdpnlobby.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdpvacm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdpvoice.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdpvvox.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdrprov.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libds32gt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsauth.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsdmo.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsdmoprp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdskquota.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdskquoui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsound.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsound3d.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsprop.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsprov.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsquery.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdssec.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdssenh.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdsuiext.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libduser.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdwmapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdwrite.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdxdiagn.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdxerr8.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdxerr9.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdxgi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdxguid.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdxtmsft.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdxtrans.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libdxva2.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libeappcfg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libeappgnui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libeapphost.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libeappprxy.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libefsadu.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libels.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libencapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libersvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libes.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libesent.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libesentprf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libesscli.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libeventcls.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libeventlog.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libevntagnt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libevntrprv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libevr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libevtgprov.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libexstrace.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libextmgr.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libf3ahvoas.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfastprox.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfaultrep.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfcachdll.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfde.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfdeploy.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfeclient.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfilemgmt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfldrclnr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfltlib.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfmifs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfontext.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfontsub.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libframedyn.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfsusd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libftpctrs2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libftpmib.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libftpsvc2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfwcfg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfwpuclnt.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxsapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxscfgwz.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxscom.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxscomex.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxsdrv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxsmon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxsocm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxsperf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxsroute.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxsst.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxst30.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxstiff.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxsui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libfxswzrd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgcdef.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgdi32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgdiplus.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgetuname.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libglmf32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libglu32.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgmon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgpedit.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgpkcsp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgptext.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libguitrn.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libgzip.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libh323msp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhal.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhbaapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhgfs.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhhsetup.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhid.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhidclass.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhidparse.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhlink.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhmmapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhnetcfg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhnetmon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhnetwiz.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhostmib.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhotplug.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhticons.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhtrn_jis.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhttpapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhttpext.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhttpmib.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhttpodbc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhtui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libhypertrm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiasacct.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiasads.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiashlpr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiasnap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiaspolcy.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiasrad.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiassam.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiassdo.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiassvcs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicaapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicfgnt5.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicm32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicmp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicmui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicwconn.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicwdial.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicwdl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicwhelp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicwphbk.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libicwutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libidq.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libieakeng.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libieaksie.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiedkcs32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libieencode.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiepeers.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiernonce.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiesetup.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libifmon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libifsutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libigmpagnt.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiis.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisadmin.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiiscfg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisclex4.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisext.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiislog.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiismap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisrstap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisrtl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiissuba.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisuiobj.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiisw3adm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiiswmi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimagehlp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimekrcic.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimeshare.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimgutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimjp81k.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimjpcic.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimjpcus.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimjpdct.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimjputyc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimm32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimsinsnt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libimskdic.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinetcfg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinetcomm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinetmgr.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinetmib1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinetpp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinetppui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinfoadmn.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinfocomm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinfoctrs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinfosoft.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinitpki.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinput.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libinseng.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiphlpapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libipmontr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libipnathlp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libippromon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiprip.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiprop.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiprtprio.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiprtrmgr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libipsecsnp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libipsecsvc.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libipsmsnap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libipv6mon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libipxsap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libirclass.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libisapips.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libisatq.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiscomlog.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiscsidsc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libisign32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libitircl.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libitss.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libixsso.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libiyuv_32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libjet500.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libjscript.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libjsproxy.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbd101.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbd101a.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbd101b.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbd101c.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbd103.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbd106.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbd106n.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbda1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbda2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbda3.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdal.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdarme.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdarmw.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdax2.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdaze.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdazel.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdbe.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdbene.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdblr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdbr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdbu.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdca.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdcan.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdcr.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdcz.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdcz1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdcz2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdda.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbddiv1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbddiv2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbddv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdes.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdest.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdfa.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdfc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdfi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdfo.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdfr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdgae.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdgeo.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdgkl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdgr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdgr1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdhe.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdhe220.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdhe319.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdheb.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdhela2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdhela3.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdhept.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdhu.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdhu1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdibm02.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdic.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdindev.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdinguj.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdinhin.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdinkan.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdinmar.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdinpun.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdintam.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdintel.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdir.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdit.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdit142.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdjpn.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdkaz.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdkor.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdkyr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdla.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdlk41a.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdlk41j.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdlt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdlt1.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdlv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdlv1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdmac.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdmon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdne.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdnec.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdnec95.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdnecat.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdnecnt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdno.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdpl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdpl1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdpo.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdro.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdru.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdru1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdsf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdsg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdsl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdsl1.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdsp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdsw.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdsyr1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdsyr2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdtat.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdth0.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdth1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdth2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdth3.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdtuf.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdtuq.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbduk.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdur.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdurdu.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdus.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdusa.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdusl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdusr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdusx.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbduzb.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdvntc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdycc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkbdycl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkd1394.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkdcom.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkerberos.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkernel32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkeymgr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkorwbrkr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libkrnlprov.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libks.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libksguid.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libksuser.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libktmw32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblangwrbk.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblargeint.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblicdll.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblicmgr10.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblicwmi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblinkinfo.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblmhsvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblmmib2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblmrt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libloadperf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblocalsec.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblocalspl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblocalui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblog.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libloghours.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblogscrpt.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblonsint.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblpdsvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblpk.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblprhelp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblprmon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblprmonui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblsasrv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liblz32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmag_hook.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmailmsg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmangle.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmapi32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmapistub.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmcastmib.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmcd32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmcdsrv32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmchgrcoi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmciavi32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmcicda.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmciole32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmciqtz32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmciseq.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmciwave.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmdhcp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmdminst.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmetadata.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmf3216.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmfc42.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmfc42u.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmfcsubs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmfplat.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmfuuid.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmgmtapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmidimap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmigism.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmiglibnt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmimefilt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmingw32.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmingwex.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmingwthrd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmlang.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmll_hp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmll_mtf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmll_qic.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmmcbase.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmmcndmgr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmmcshext.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmmfutil.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmmutilse.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmobsync.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmodemui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmofd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmoldname.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmpr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmprapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmprddm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmprdim.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmprmsg.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmprui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqad.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqcertui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqdscli.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqgentr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqise.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqlogmgr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqoa.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqperf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqqm.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqrt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqrtdep.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqsec.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqsnap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqtrig.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqupgrd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmqutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsaatext.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsacm32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsadce.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsadcf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsadco.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsadcs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsadds.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsado15.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsadomd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsador15.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsadox.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsadrh15.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsafd.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsasn1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmscandui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmscat32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmscms.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsctfmonitor.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsctfp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdadiag.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdaosp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdaprst.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdaps.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdarem.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdart.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdatl3.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdfmap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdmo.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdrm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdtclog.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdtcprx.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdtcstp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdtctm.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsdtcuiu.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsftedit.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsgina.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsgr3en.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsgrocm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsgsvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmshtml.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmshtmled.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsident.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsieftp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsihnd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsimg32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsimtf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsinfo.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsiprov.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsir3jp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsisip.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmslbui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsls31.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmslwvtts.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsmqocm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsobcomm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsobdl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsobmain.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsobshel.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsobweb.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsoe.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsoeacct.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsoert2.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmspatcha.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmspmsnsv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsports.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsrating.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsrle32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmssign32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmssip32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmstask.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmstime.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmstlsapi.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmstscax.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsutb.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsv1_0.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvcirt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvcp60.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvcr100.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvcr110.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvcr80.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvcr90.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvcr90d.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvcrt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvfw32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvidc32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsvidctl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsw3prt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmswsock.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsxactps.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsxml3.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsxs64.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmsyuv.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmtxclu.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmtxdm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmtxex.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmtxoci.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmycomput.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libmydocs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnarrhook.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libncobjapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libncprov.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libncrypt.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libncxpnt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnddeapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnddenb32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libndfapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libndis.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libndisnpp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetapi32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetcfgx.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetid.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetlogon.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetman.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetoc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetplwiz.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetrap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetshell.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetui0.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetui1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnetui2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnewdev.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnextlink.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnlhtml.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnntpadm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnntpapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnntpsnap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnormaliz.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnpptools.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnshipsec.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntdll.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntdsapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntdsbcli.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntevt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntfsdrv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntlanman.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntlanui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntlanui2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntlsapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntmarta.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntmsapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntmsdba.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntmsevt.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntmsmgr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntmssvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntoc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntoskrnl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntprint.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntshrui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libntvdm64.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libnwprovau.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboakley.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libobjsel.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboccache.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libocgen.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libocmanage.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libocmsn.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libodbc32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libodbc32gt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libodbcbcp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libodbcconf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libodbccp32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libodbccr32.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libodbccu32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libodbctrac.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboeimport.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboemiglib.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libofffilt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libole32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboleacc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboleaut32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libolecli32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libolecnv32.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboledb32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboledb32r.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboledlg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liboleprn.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libolesvr32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libopengl32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libosuninst.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libovprintmondll.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libp2p.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libp2pcollab.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libp2pgraph.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpanmap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpautoenr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpchshell.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpchsvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpcwum.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpdh.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libperfctrs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libperfdisk.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libperfnet.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libperfos.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libperfproc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libperfts.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libphotowiz.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpid.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpidgen.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpintlcsa.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpintlcsd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpjlmon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpngfilt.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpolicman.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpolstore.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libportabledeviceguids.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpowrprof.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libprintui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libprofmap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libprovthrd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libPS5UI.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpsapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpsbase.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpschdprf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libPSCRIPT5.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpsnppagn.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpstorec.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libpstorsvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqasf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqcap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqdv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqdvd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqedit.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqmgr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqmgrprxy.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqosname.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libquartz.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libquery.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libqwave.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libracpldlg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasadhlp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasapi32.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasauto.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libraschap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasctrs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasdlg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasman.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasmans.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasmontr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasmxs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasppp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasrad.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librassapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librasser.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librastapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librastls.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librcbdyctl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librdchost.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librdpcfgex.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librdpsnd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librdpwsx.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libregapi.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libregsvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libregwizc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libremotepg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librend.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librepdrvfs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libresutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libresutils.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libriched20.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librnr20.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libroutetab.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librpcdiag.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librpchttp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librpcns4.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librpcnsh.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librpcref.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librpcrt4.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librpcss.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librsaenh.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librsfsaps.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librshx32.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librsmps.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librstrmgr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librtm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librtutils.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libruntimeobject.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/librwnh.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsafrcdlg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsafrdm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsafrslv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsamlib.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsamsrv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscarddlg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsccbase.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsccsccp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscecli.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscesrv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libschannel.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libschedsvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsclgntfy.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscredir.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscript.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscripto.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscriptpw.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscrnsave.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscrnsavw.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscrobj.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscrptutl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libscrrun.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsdhcinst.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsdpblb.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libseclogon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsecur32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsecurity.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsendcmsg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsendmail.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsens.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsensapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsenscfg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsensorsapi.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libseo.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libseos.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libserialui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libservdeps.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libserwvdrv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsetupapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsetupqry.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsfc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsfcfiles.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsfc_os.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsfmapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshdocvw.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshell32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshfolder.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshgina.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshimeng.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshimgvw.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshlwapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshmedia.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshscrap.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libshsvcs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsigtab.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsimptcp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsisbkup.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libskdll.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libslayerxp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libslbcsp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libslbiop.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libslc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libslcext.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libslwga.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsmlogcfg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsmtpadm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsmtpapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsmtpcons.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsmtpctrs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsmtpsnap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsmtpsvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsniffpol.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnmpapi.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnmpcl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnmpincl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnmpmib.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnmpsmir.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnmpsnap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnmpstup.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnmpthrd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsnprfdll.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsoftkbd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsoftpub.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libspcommon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libspoolss.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsptip.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libspttseng.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsqlsrv32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsqlxmlx.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsrchctls.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsrchui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsrclient.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsrrstr.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsrsvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsrvsvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libssdpapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libssdpsrv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libssinc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsspicli.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsstub.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libstaxmem.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libstclient.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libstdprov.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsti.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsti_ci.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libstobject.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libstorprop.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libstreamci.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libstrmfilt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libstrmiids.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsvcext.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsvcpack.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libswprv.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsxs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsynceng.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsyncui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsysinv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsysmod.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libsyssetup.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libt2embed.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtapi3.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtapi32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtapiperf.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtapisrv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtbs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtcpmib.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtcpmon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtcpmonui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtdh.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtermmgr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtermsrv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libthawbrkr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libthemeui.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtlntsvrp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtraffic.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtrialoc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtrkwks.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtsappcmp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtsbyuv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtscfgwmi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtsd32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtshoot.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtsoc.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtwext.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtxflog.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libtxfw32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libudhisapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libufat.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libuihelper.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libulib.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libumandlg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libumdmxfrm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libumpnpmgr.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libUNIDRV.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libUNIDRVUI.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libuniime.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libunimdmat.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libuniplat.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libuntfs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libupnp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libupnphost.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libupnpui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libureg.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liburl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liburlauth.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/liburlmon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libusbcamd2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libusbd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libusbmon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libusbport.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libuser32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libuserenv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libusp10.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libutildll.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libuuid.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libuxtheme.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvbscript.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvdsbas.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvdsdyndr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvdsutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvdswmi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvds_ps.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libverifier.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libversion.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvfw32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvgx.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libviewprov.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvmx_mode.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvssapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvsstrace.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvsswmi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libvss_ps.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw32time.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw32topl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3cache.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3comlog.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3core.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3ctrlps.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3ctrs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3dt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3ext.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3isapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3ssl.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libw3tp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwab32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwabimp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwamreg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwamregps.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwbemcore.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwbemupgd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwbemuuid.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdigest.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdmaud.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdsclient.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdsclientapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdscore.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdscsl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdsimage.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdstptc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdsupgcompl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwdsutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwebcheck.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwebclnt.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwebhits.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwecapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwer.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwevtapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwevtfwd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwiadss.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwiarpc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwiaservc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwiashext.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwin32spl.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwindowscodecs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinfax.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinhttp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwininet.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinipsec.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinmm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinrnr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinscard.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinspool.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinsrv.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinsta.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwintrust.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwinusb.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwkssvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwlanapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwlanui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwlanutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwldap32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwlnotify.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwlstore.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwmcodecdspuuid.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwmi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwmi2xml.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwmiaprpl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwmilib.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwmiprop.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwmisvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwow64.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwow64cpu.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwow64mib.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwow64win.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwpd_ci.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libws2help.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libws2_32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwscsvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwsdapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwshatm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwshbth.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwshcon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwsock32.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libwtsapi32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libx3daudio.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libx3daudio1_2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libx3daudio1_3.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libx3daudio1_4.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libx3daudio1_5.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libx3daudio1_6.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libx3daudio1_7.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libx3daudiod1_7.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxapofx.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxapofx1_0.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxapofx1_1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxapofx1_2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxapofx1_3.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxapofx1_4.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxapofx1_5.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxapofxd1_5.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxaudio2_8.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxinput.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxinput1_1.a "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxinput1_2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxinput1_3.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxinput1_4.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libxinput9_1_0.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/libzoneoc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib/txtmode.o "tdm/mingwrt/x86_64-w64-mingw32/lib"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/binmode.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/crt1.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/crt1u.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/crt2.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/crt2u.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/crtbegin.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/crtend.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/CRT_fp10.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/CRT_fp8.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/CRT_glob.o "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/CRT_noglob.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/dllcrt1.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/dllcrt2.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/gcrt0.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/gcrt1.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/gcrt2.o tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libaclui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libactiveds.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libadsldpc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libadvapi32.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libapcups.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libapi-ms-win-core-winrt-l1-1-0.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libapi-ms-win-core-winrt-string-l1-1-0.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libauthz.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libavicap32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libavifil32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libavrt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libbcrypt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libbootvid.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libbrowcli.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libbthprops.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcabinet.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcap.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcfgmgr32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libclasspnp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libclfsw32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libclusapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcmutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcomctl32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcomdlg32.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libconnect.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcredui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcrtdll.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcrypt32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcryptnet.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcryptsp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcryptxml.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libcscapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libctl3d32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd2d1.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3d11.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3d8.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3d9.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_33.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_34.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_35.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_36.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_37.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_38.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_39.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_40.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_41.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_42.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_43.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcompiler_46.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcsxd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcsxd_43.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dcsx_46.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dim.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3drm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_33.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_34.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_35.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_36.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_37.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_38.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_39.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_40.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_41.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_42.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx10_43.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx11.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx11_42.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx11_43.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx8d.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9d.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_24.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_25.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_26.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_27.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_28.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_29.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_30.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_31.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_33.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_34.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_35.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_36.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_37.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_38.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_39.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_40.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_41.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_42.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dx9_43.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libd3dxof.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdavclnt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdavhlpr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdbgeng.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdbghelp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libddraw.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdelayimp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdevmgr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdevobj.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdevrtl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdfscli.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdhcpcsvc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdhcpcsvc6.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdhcpsapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdinput.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdinput8.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdlcapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdmoguids.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdnsapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdplayx.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdpnaddr.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdpnet.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdpnlobby.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdpvoice.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdsetup.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdsound.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdsrole.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdssec.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdwmapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdwrite.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdxapi.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdxerr8.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdxerr9.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdxgi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdxguid.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libdxva2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libeapp3hst.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libeappcfg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libeappgnui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libeapphost.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libeappprxy.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libelscore.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libesent.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libevr.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libfaultrep.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libfwpuclnt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libgdi32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libgdiplus.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libglaux.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libglu32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libglut.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libglut32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libgmon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libgpapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libgpedit.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libgpprefcl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libgpscript.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libgptext.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libhal.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libhid.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libhidclass.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libhidparse.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libhttpapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libicmui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libigmpagnt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libimagehlp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libimm32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libiphlpapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libiscsidsc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libkernel32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libks.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libksguid.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libksproxy.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libksuser.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libktmw32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/liblargeint.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/liblogoncli.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/liblz32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmapi32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmcd.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmfcuia32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmfplat.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmfuuid.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmgmtapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmingw32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmingwex.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmingwthrd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmoldname.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmpr.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmprapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmqrt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsacm32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmscms.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsctf.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsctfmonitor.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsdmo.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsdrm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmshtml.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmshtmled.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsimg32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmstask.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsvcp60.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsvcr100.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsvcr110.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsvcr80.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsvcr90.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsvcr90d.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsvcrt.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmsvfw32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libmswsock.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libncrypt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libnddeapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libndfapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libndis.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libnetapi32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libnetjoin.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libnetutils.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libnewdev.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libnormaliz.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libntdll.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libntdsapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libntmsapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libntoskrnl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libodbc32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libodbccp32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libole32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/liboleacc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/liboleaut32.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libolecli32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/liboledlg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libolepro32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libolesvr32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libolethk32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libopengl32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libp2p.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libp2pcollab.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libp2pgraph.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libpcwum.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libpdh.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libpdhui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libpenwin32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libpkpd32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libportabledeviceguids.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libpowrprof.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libpsapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libquartz.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libqutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libqwave.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librasapi32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librasdlg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libresutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librpcdce4.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librpcdiag.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librpchttp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librpcns4.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librpcrt4.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librstrmgr.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librtm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/librtutils.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libruntimeobject.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsamcli.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libschedcli.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libscrnsave.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libscrnsavw.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libscsiport.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsecur32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsensorsapi.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsetupapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libshell32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libshfolder.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libshlwapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libslc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libslcext.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libslwga.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsnmpapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libspoolss.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsrvcli.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsspicli.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libstrmiids.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsvrapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libsxs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libt2embed.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libtapi32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libtbs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libtdh.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libtdi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libtxfw32.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/liburl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/liburlmon.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libusbcamd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libusbcamd2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libusbd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libusbport.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libuser32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libuserenv.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libusp10.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libuuid.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libuxtheme.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libvdmdbg.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libversion.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libvfw32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libvideoprt.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libvirtdisk.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libvssapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libvsstrace.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libvss_ps.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwbemuuid.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwdsclient.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwdsclientapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwdscore.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwdscsl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwdsimage.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwdstptc.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwdsupgcompl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwdsutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwecapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwer.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwevtapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwevtfwd.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwiadss.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwin32k.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwin32spl.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwindowscodecs.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwinhttp.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwininet.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwinmm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwinscard.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwinspool.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwinstrm.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwintrust.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwinusb.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwkscli.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwlanapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwlanui.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwlanutil.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwldap32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwmcodecdspuuid.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwmilib.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwow32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libws2_32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwsdapi.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwsnmp32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwsock32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwst.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libwtsapi32.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libx3daudio.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libx3daudio1_2.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libx3daudio1_3.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libx3daudio1_4.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libx3daudio1_5.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libx3daudio1_6.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libx3daudio1_7.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libx3daudiod1_7.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxapofx.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxapofx1_0.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxapofx1_1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxapofx1_2.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxapofx1_3.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxapofx1_4.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxapofx1_5.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxapofxd1_5.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxaudio2_8.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxinput.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxinput1_1.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxinput1_2.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxinput1_3.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxinput1_4.a "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/libxinput9_1_0.a tdm/mingw64runtime-v4-git20150618-gcc5-tdm64-1/x86_64-w64-mingw32/lib32/txtmode.o "tdm/mingwrt/x86_64-w64-mingw32/lib32"
	$(EAR) aw$(EARFLAGS) $(TARGET) locale/es.mo locale/pt_BR.mo locale/ru.mo locale/zh_CN.mo "locale"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/es.png ../extras/res/types/countryCode/gb.png ../extras/res/types/countryCode/hu.png ../extras/res/types/countryCode/cn.png ../extras/res/types/countryCode/pt.png ../extras/res/types/countryCode/vn.png ../extras/res/types/countryCode/ru.png ../extras/res/types/countryCode/in.png ../extras/res/types/countryCode/nl.png ../extras/res/types/countryCode/il.png "countryCode"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/types/countryCode/br.png "countryCode"
else
ifdef WINDOWS_HOST
	$(AR) rcs $(TARGET) @$(OBJ)objects.lst $(LIBS)
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
endif
ifdef SHARED_LIBRARY_TARGET
ifdef LINUX_TARGET
ifdef LINUX_HOST
	$(if $(basename $(VER)),ln -sf $(LP)$(MODULE)$(SO)$(VER) $(OBJ)$(LP)$(MODULE)$(SO)$(basename $(VER)),)
	$(if $(VER),ln -sf $(LP)$(MODULE)$(SO)$(VER) $(OBJ)$(LP)$(MODULE)$(SO),)
endif
endif
endif

# SYMBOL RULES

$(OBJ)IDESettings.sym: ../ide/src/IDESettings.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,../ide/src/IDESettings.ec) -o $(call quote_path,$@)

$(OBJ)OldIDESettings.sym: ../ide/src/OldIDESettings.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,../ide/src/OldIDESettings.ec) -o $(call quote_path,$@)

$(OBJ)installer.sym: src/installer.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,src/installer.ec) -o $(call quote_path,$@)

$(OBJ)StringsBox.sym: ../extras/gui/controls/StringsBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,../extras/gui/controls/StringsBox.ec) -o $(call quote_path,$@)

$(OBJ)licensing.sym: ../ide/src/licensing.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,../ide/src/licensing.ec) -o $(call quote_path,$@)

$(OBJ)createLink.sym: ../extras/createLink.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,../extras/createLink.ec) -o $(call quote_path,$@)

$(OBJ)CheckListBox.sym: ../extras/gui/controls/CheckListBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,../extras/gui/controls/CheckListBox.ec) -o $(call quote_path,$@)

# C OBJECT RULES

$(OBJ)IDESettings.c: ../ide/src/IDESettings.ec $(OBJ)IDESettings.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,../ide/src/IDESettings.ec) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)OldIDESettings.c: ../ide/src/OldIDESettings.ec $(OBJ)OldIDESettings.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,../ide/src/OldIDESettings.ec) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)installer.c: src/installer.ec $(OBJ)installer.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,src/installer.ec) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)StringsBox.c: ../extras/gui/controls/StringsBox.ec $(OBJ)StringsBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,../extras/gui/controls/StringsBox.ec) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)licensing.c: ../ide/src/licensing.ec $(OBJ)licensing.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,../ide/src/licensing.ec) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)createLink.c: ../extras/createLink.ec $(OBJ)createLink.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,../extras/createLink.ec) -o $(call quote_path,$@) -symbols $(OBJ)

$(OBJ)CheckListBox.c: ../extras/gui/controls/CheckListBox.ec $(OBJ)CheckListBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,../extras/gui/controls/CheckListBox.ec) -o $(call quote_path,$@) -symbols $(OBJ)

# OBJECT RULES

$(OBJ)IDESettings.o: $(OBJ)IDESettings.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$(OBJ)IDESettings.c) -o $(call quote_path,$@)

$(OBJ)OldIDESettings.o: $(OBJ)OldIDESettings.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$(OBJ)OldIDESettings.c) -o $(call quote_path,$@)

$(OBJ)installer.o: $(OBJ)installer.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$(OBJ)installer.c) -o $(call quote_path,$@)

$(OBJ)StringsBox.o: $(OBJ)StringsBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$(OBJ)StringsBox.c) -o $(call quote_path,$@)

$(OBJ)licensing.o: $(OBJ)licensing.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$(OBJ)licensing.c) -o $(call quote_path,$@)

$(OBJ)createLink.o: $(OBJ)createLink.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$(OBJ)createLink.c) -o $(call quote_path,$@)

$(OBJ)CheckListBox.o: $(OBJ)CheckListBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(call quote_path,$(OBJ)CheckListBox.c) -o $(call quote_path,$@)

ifdef WINDOWS_TARGET

$(OBJ)resources.o: ../ide/src/resources.rc
	$(WINDRES) $(WINDRES_FLAGS) $< "$(call escspace,$(call quote_path,$@))"
endif

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.c -o $(call quote_path,$@)

cleantarget:
	$(call rm,$(OBJ)$(MODULE).main.o $(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S))
	$(call rm,$(OBJ)symbols.lst)
	$(call rm,$(OBJ)objects.lst)
	$(call rm,$(TARGET))
ifdef SHARED_LIBRARY_TARGET
ifdef LINUX_TARGET
ifdef LINUX_HOST
	$(call rm,$(OBJ)$(LP)$(MODULE)$(SO)$(basename $(VER)))
	$(call rm,$(OBJ)$(LP)$(MODULE)$(SO))
endif
endif
endif

clean: cleantarget
	$(call rm,$(_OBJECTS))
ifdef WINDOWS_TARGET
	$(call rm,$(_RCOBJECTS))
endif
	$(call rm,$(_ECOBJECTS))
	$(call rm,$(_COBJECTS))
	$(call rm,$(_BOWLS))
	$(call rm,$(_IMPORTS))
	$(call rm,$(_SYMBOLS))

realclean: cleantarget
	$(call rmr,$(OBJ))

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

Makefile: ;
$(_CF_DIR)crossplatform.mk: ;
$(_CF_DIR)default.cf: ;
