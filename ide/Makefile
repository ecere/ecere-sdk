.PHONY: all objdir cleantarget clean realclean distclean

# CORE VARIABLES

MODULE := ide
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

RES = res/

TARGET = obj/$(CONFIG).$(PLATFORM)/ide$(E)

_ECSOURCES = \
	../extras/FileSystemIterator.ec \
	../extras/gui/layout.ec \
	../extras/gui/controls/StringsBox.ec \
	../extras/types/DynamicString.ec \
	src/dialogs/CompilersDetectionDialog.ec \
	src/dialogs/FindInFilesDialog.ec \
	src/dialogs/GlobalSettingsDialog.ec \
	src/dialogs/NewProjectDialog.ec \
	src/dialogs/NodeProperties.ec \
	src/dialogs/WorkspaceSettings.ec \
	src/dialogs/ProjectTabSettings.ec \
	src/project/Project.ec \
	src/project/ProjectConfig.ec \
	src/project/ProjectNode.ec \
	src/project/ProjectView.ec \
	src/project/Workspace.ec \
	$(if $(WINDOWS_TARGET),src/project/vsSupport.ec,) \
	src/designer/CodeEditor.ec \
	src/designer/CodeObject.ec \
	src/designer/Designer.ec \
	src/designer/findCtx.ec \
	src/designer/findExp.ec \
	src/designer/findParams.ec \
	src/designer/Sheet.ec \
	src/designer/ToolBox.ec \
	src/debugger/debugFindCtx.ec \
	src/debugger/Debugger.ec \
	src/debugger/debugTools.ec \
	src/debugger/GDBDialog.ec \
	src/debugger/process.ec \
	src/panels/BreakpointsView.ec \
	src/panels/CallStackView.ec \
	src/panels/OutputView.ec \
	src/panels/ThreadsView.ec \
	src/panels/WatchesView.ec \
	src/documents/ModelView.ec \
	src/documents/PictureEdit.ec \
	src/about.ec \
	src/ide.ec \
	src/IDESettings.ec \
	src/OldIDESettings.ec \
	src/ProjectSettings.ec \
	src/licensing.ec

ECSOURCES = $(call shwspace,$(_ECSOURCES))

COBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES)))))

SYMBOLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES)))))

IMPORTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES)))))

ECOBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES)))))

BOWLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES)))))

OBJECTS = $(ECOBJECTS) $(OBJ)$(MODULE).main$(O)

SOURCES = $(ECSOURCES)

RESOURCES = $(RESOURCES1) $(RESOURCES2)
RESOURCES1 = \
	$(RES)actions/attach.png \
	$(RES)actions/delete.png \
	$(RES)actions/detach.png \
	$(RES)actions/docNew.png \
	$(RES)actions/editCopy.png \
	$(RES)actions/editDelete.png \
	$(RES)actions/delete2.png \
	$(RES)actions/build.png \
	$(RES)actions/clean.png \
	$(RES)actions/debug.png \
	$(RES)actions/docOpen.png \
	$(RES)actions/docSave.png \
	$(RES)actions/docSaveAll.png \
	$(RES)actions/pause.png \
	$(RES)actions/projAdd.png \
	$(RES)actions/projNew.png \
	$(RES)actions/projOpen.png \
	$(RES)actions/rebuild.png \
	$(RES)actions/regMakefile.png \
	$(RES)actions/relink.png \
	$(RES)actions/restart.png \
	$(RES)actions/run.png \
	$(RES)actions/skipBreaks.png \
	$(RES)actions/stepInto.png \
	$(RES)actions/stepOut.png \
	$(RES)actions/stepOver.png \
	$(RES)actions/stopDebug.png \
	$(RES)codeMarks/breakpoint.png \
	$(RES)codeMarks/breakpointDisabled.png \
	$(RES)codeMarks/breakpointHalf.png \
	$(RES)codeMarks/breakpointHalfDisabled.png \
	$(RES)codeMarks/cursor.png \
	$(RES)codeMarks/cursorError.png \
	$(RES)codeMarks/topFrame.png \
	$(RES)codeMarks/topFrameError.png \
	$(RES)codeMarks/topFrameHalf.png \
	$(RES)codeMarks/topFrameHalfError.png \
	$(RES)others/mousePointer.png \
	locale/zh_CN/LC_MESSAGES/ide.mo \
	locale/es_ES/LC_MESSAGES/ide.mo \
	../LICENSE \
	../extras/res/licenses/png.LICENSE \
	../extras/res/licenses/tango.COPYING \
	../extras/res/licenses/zlib.README \
	../extras/res/licenses/sqlite.LICENSE \
	../extras/res/licenses/jpg.LICENSE \
	../extras/res/licenses/ungif.LICENSE \
	../extras/res/licenses/freetype.LICENSE
RESOURCES2 = \
	../extras/res/licenses/harfbuzz.LICENSE \
	../extras/res/licenses/upx.LICENSE \
	../extras/res/licenses/gpl.LICENSE \
	res/ecere.jpg \
	res/ecereBack.jpg \
	res/icon.png \
	../crossplatform.mk

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,ecere)
endif

PRJ_CFLAGS += \
	 $(if $(LINUX_TARGET), \
			 -I/usr/X11R6/include,) \
	 $(if $(OSX_TARGET), \
			 -I/usr/X11R6/include,) \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FORCE_32_BIT) $(FPIC) -w \
			 $(FVISIBILITY)



ECFLAGS += \
	 -nolinenumbers


# PLATFORM-SPECIFIC OPTIONS

ifdef WINDOWS_TARGET

ifndef STATIC_LIBRARY_TARGET
LIBS += obj/resources.o
endif

else
ifdef LINUX_TARGET

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L/usr/X11R6/lib
LIBS += \
	$(call _L,X11)
endif

else
ifdef OSX_TARGET

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L/usr/X11R6/lib
LIBS += \
	$(call _L,X11)
endif

endif
endif
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
	$(ECS) $(ECSLIBOPT) $(SYMBOLS) $(IMPORTS) -symbols obj/$(CONFIG).$(PLATFORM) -o $(OBJ)$(MODULE).main.ec

$(OBJ)$(MODULE).main.c: $(OBJ)$(MODULE).main.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.sym -symbols $(OBJ)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.c -symbols $(OBJ)

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
ifndef STATIC_LIBRARY_TARGET
ifdef WINDOWS_TARGET
$(TARGET): obj/resources.o
endif
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
	$(EAR) aw$(EARFLAGS) $(TARGET) res/ecere.jpg res/ecereBack.jpg res/icon.png ../crossplatform.mk ""
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)actions/attach.png $(RES)actions/delete.png $(RES)actions/detach.png $(RES)actions/docNew.png $(RES)actions/editCopy.png $(RES)actions/editDelete.png $(RES)actions/delete2.png $(RES)actions/build.png $(RES)actions/clean.png $(RES)actions/debug.png "actions"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)actions/docOpen.png $(RES)actions/docSave.png $(RES)actions/docSaveAll.png $(RES)actions/pause.png $(RES)actions/projAdd.png $(RES)actions/projNew.png $(RES)actions/projOpen.png $(RES)actions/rebuild.png $(RES)actions/regMakefile.png $(RES)actions/relink.png "actions"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)actions/restart.png $(RES)actions/run.png $(RES)actions/skipBreaks.png $(RES)actions/stepInto.png $(RES)actions/stepOut.png $(RES)actions/stepOver.png $(RES)actions/stopDebug.png "actions"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)codeMarks/breakpoint.png $(RES)codeMarks/breakpointDisabled.png $(RES)codeMarks/breakpointHalf.png $(RES)codeMarks/breakpointHalfDisabled.png $(RES)codeMarks/cursor.png $(RES)codeMarks/cursorError.png $(RES)codeMarks/topFrame.png $(RES)codeMarks/topFrameError.png $(RES)codeMarks/topFrameHalf.png $(RES)codeMarks/topFrameHalfError.png "codeMarks"
	$(EAR) aw$(EARFLAGS) $(TARGET) $(RES)others/mousePointer.png "others"
	$(EAR) aw$(EARFLAGS) $(TARGET) locale/zh_CN/LC_MESSAGES/ide.mo "locale/zh_CN/LC_MESSAGES"
	$(EAR) aw$(EARFLAGS) $(TARGET) locale/es_ES/LC_MESSAGES/ide.mo "locale/es_ES/LC_MESSAGES"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../LICENSE ../extras/res/licenses/png.LICENSE ../extras/res/licenses/tango.COPYING ../extras/res/licenses/zlib.README ../extras/res/licenses/sqlite.LICENSE ../extras/res/licenses/jpg.LICENSE ../extras/res/licenses/ungif.LICENSE ../extras/res/licenses/freetype.LICENSE ../extras/res/licenses/harfbuzz.LICENSE ../extras/res/licenses/upx.LICENSE "licenses"
	$(EAR) aw$(EARFLAGS) $(TARGET) ../extras/res/licenses/gpl.LICENSE "licenses"
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
	$(call cpq,$(TARGET),../obj/$(PLATFORM)/bin/)

ifdef WINDOWS_TARGET
obj/resources.o: src/icon2.ico src/resources.rc | objdir
	$(GCC_PREFIX)windres src/resources.rc obj/resources.o
endif

# SYMBOL RULES

$(OBJ)FileSystemIterator.sym: ../extras/FileSystemIterator.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../extras/FileSystemIterator.ec -o $(OBJ)FileSystemIterator.sym

$(OBJ)layout.sym: ../extras/gui/layout.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../extras/gui/layout.ec -o $(OBJ)layout.sym

$(OBJ)StringsBox.sym: ../extras/gui/controls/StringsBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../extras/gui/controls/StringsBox.ec -o $(OBJ)StringsBox.sym

$(OBJ)DynamicString.sym: ../extras/types/DynamicString.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c ../extras/types/DynamicString.ec -o $(OBJ)DynamicString.sym

$(OBJ)CompilersDetectionDialog.sym: src/dialogs/CompilersDetectionDialog.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/dialogs/CompilersDetectionDialog.ec -o $(OBJ)CompilersDetectionDialog.sym

$(OBJ)FindInFilesDialog.sym: src/dialogs/FindInFilesDialog.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/dialogs/FindInFilesDialog.ec -o $(OBJ)FindInFilesDialog.sym

$(OBJ)GlobalSettingsDialog.sym: src/dialogs/GlobalSettingsDialog.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/dialogs/GlobalSettingsDialog.ec -o $(OBJ)GlobalSettingsDialog.sym

$(OBJ)NewProjectDialog.sym: src/dialogs/NewProjectDialog.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/dialogs/NewProjectDialog.ec -o $(OBJ)NewProjectDialog.sym

$(OBJ)NodeProperties.sym: src/dialogs/NodeProperties.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/dialogs/NodeProperties.ec -o $(OBJ)NodeProperties.sym

$(OBJ)WorkspaceSettings.sym: src/dialogs/WorkspaceSettings.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/dialogs/WorkspaceSettings.ec -o $(OBJ)WorkspaceSettings.sym

$(OBJ)ProjectTabSettings.sym: src/dialogs/ProjectTabSettings.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/dialogs/ProjectTabSettings.ec -o $(OBJ)ProjectTabSettings.sym

$(OBJ)Project.sym: src/project/Project.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/project/Project.ec -o $(OBJ)Project.sym

$(OBJ)ProjectConfig.sym: src/project/ProjectConfig.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/project/ProjectConfig.ec -o $(OBJ)ProjectConfig.sym

$(OBJ)ProjectNode.sym: src/project/ProjectNode.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/project/ProjectNode.ec -o $(OBJ)ProjectNode.sym

$(OBJ)ProjectView.sym: src/project/ProjectView.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/project/ProjectView.ec -o $(OBJ)ProjectView.sym

$(OBJ)Workspace.sym: src/project/Workspace.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/project/Workspace.ec -o $(OBJ)Workspace.sym

ifdef WINDOWS_TARGET

$(OBJ)vsSupport.sym: src/project/vsSupport.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/project/vsSupport.ec -o $(OBJ)vsSupport.sym

endif

$(OBJ)CodeEditor.sym: src/designer/CodeEditor.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/designer/CodeEditor.ec -o $(OBJ)CodeEditor.sym

$(OBJ)CodeObject.sym: src/designer/CodeObject.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/designer/CodeObject.ec -o $(OBJ)CodeObject.sym

$(OBJ)Designer.sym: src/designer/Designer.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/designer/Designer.ec -o $(OBJ)Designer.sym

$(OBJ)findCtx.sym: src/designer/findCtx.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/designer/findCtx.ec -o $(OBJ)findCtx.sym

$(OBJ)findExp.sym: src/designer/findExp.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/designer/findExp.ec -o $(OBJ)findExp.sym

$(OBJ)findParams.sym: src/designer/findParams.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/designer/findParams.ec -o $(OBJ)findParams.sym

$(OBJ)Sheet.sym: src/designer/Sheet.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/designer/Sheet.ec -o $(OBJ)Sheet.sym

$(OBJ)ToolBox.sym: src/designer/ToolBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/designer/ToolBox.ec -o $(OBJ)ToolBox.sym

$(OBJ)debugFindCtx.sym: src/debugger/debugFindCtx.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/debugger/debugFindCtx.ec -o $(OBJ)debugFindCtx.sym

$(OBJ)Debugger.sym: src/debugger/Debugger.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/debugger/Debugger.ec -o $(OBJ)Debugger.sym

$(OBJ)debugTools.sym: src/debugger/debugTools.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/debugger/debugTools.ec -o $(OBJ)debugTools.sym

$(OBJ)GDBDialog.sym: src/debugger/GDBDialog.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/debugger/GDBDialog.ec -o $(OBJ)GDBDialog.sym

$(OBJ)process.sym: src/debugger/process.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/debugger/process.ec -o $(OBJ)process.sym

$(OBJ)BreakpointsView.sym: src/panels/BreakpointsView.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/panels/BreakpointsView.ec -o $(OBJ)BreakpointsView.sym

$(OBJ)CallStackView.sym: src/panels/CallStackView.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/panels/CallStackView.ec -o $(OBJ)CallStackView.sym

$(OBJ)OutputView.sym: src/panels/OutputView.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/panels/OutputView.ec -o $(OBJ)OutputView.sym

$(OBJ)ThreadsView.sym: src/panels/ThreadsView.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/panels/ThreadsView.ec -o $(OBJ)ThreadsView.sym

$(OBJ)WatchesView.sym: src/panels/WatchesView.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/panels/WatchesView.ec -o $(OBJ)WatchesView.sym

$(OBJ)ModelView.sym: src/documents/ModelView.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/documents/ModelView.ec -o $(OBJ)ModelView.sym

$(OBJ)PictureEdit.sym: src/documents/PictureEdit.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/documents/PictureEdit.ec -o $(OBJ)PictureEdit.sym

$(OBJ)about.sym: src/about.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/about.ec -o $(OBJ)about.sym

$(OBJ)ide.sym: src/ide.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/ide.ec -o $(OBJ)ide.sym

$(OBJ)IDESettings.sym: src/IDESettings.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/IDESettings.ec -o $(OBJ)IDESettings.sym

$(OBJ)OldIDESettings.sym: src/OldIDESettings.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/OldIDESettings.ec -o $(OBJ)OldIDESettings.sym

$(OBJ)ProjectSettings.sym: src/ProjectSettings.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/ProjectSettings.ec -o $(OBJ)ProjectSettings.sym

$(OBJ)licensing.sym: src/licensing.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/licensing.ec -o $(OBJ)licensing.sym

# C OBJECT RULES

$(OBJ)FileSystemIterator.c: ../extras/FileSystemIterator.ec $(OBJ)FileSystemIterator.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../extras/FileSystemIterator.ec -o $(OBJ)FileSystemIterator.c -symbols $(OBJ)

$(OBJ)layout.c: ../extras/gui/layout.ec $(OBJ)layout.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../extras/gui/layout.ec -o $(OBJ)layout.c -symbols $(OBJ)

$(OBJ)StringsBox.c: ../extras/gui/controls/StringsBox.ec $(OBJ)StringsBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../extras/gui/controls/StringsBox.ec -o $(OBJ)StringsBox.c -symbols $(OBJ)

$(OBJ)DynamicString.c: ../extras/types/DynamicString.ec $(OBJ)DynamicString.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c ../extras/types/DynamicString.ec -o $(OBJ)DynamicString.c -symbols $(OBJ)

$(OBJ)CompilersDetectionDialog.c: src/dialogs/CompilersDetectionDialog.ec $(OBJ)CompilersDetectionDialog.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/dialogs/CompilersDetectionDialog.ec -o $(OBJ)CompilersDetectionDialog.c -symbols $(OBJ)

$(OBJ)FindInFilesDialog.c: src/dialogs/FindInFilesDialog.ec $(OBJ)FindInFilesDialog.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/dialogs/FindInFilesDialog.ec -o $(OBJ)FindInFilesDialog.c -symbols $(OBJ)

$(OBJ)GlobalSettingsDialog.c: src/dialogs/GlobalSettingsDialog.ec $(OBJ)GlobalSettingsDialog.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/dialogs/GlobalSettingsDialog.ec -o $(OBJ)GlobalSettingsDialog.c -symbols $(OBJ)

$(OBJ)NewProjectDialog.c: src/dialogs/NewProjectDialog.ec $(OBJ)NewProjectDialog.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/dialogs/NewProjectDialog.ec -o $(OBJ)NewProjectDialog.c -symbols $(OBJ)

$(OBJ)NodeProperties.c: src/dialogs/NodeProperties.ec $(OBJ)NodeProperties.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/dialogs/NodeProperties.ec -o $(OBJ)NodeProperties.c -symbols $(OBJ)

$(OBJ)WorkspaceSettings.c: src/dialogs/WorkspaceSettings.ec $(OBJ)WorkspaceSettings.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/dialogs/WorkspaceSettings.ec -o $(OBJ)WorkspaceSettings.c -symbols $(OBJ)

$(OBJ)ProjectTabSettings.c: src/dialogs/ProjectTabSettings.ec $(OBJ)ProjectTabSettings.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/dialogs/ProjectTabSettings.ec -o $(OBJ)ProjectTabSettings.c -symbols $(OBJ)

$(OBJ)Project.c: src/project/Project.ec $(OBJ)Project.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/project/Project.ec -o $(OBJ)Project.c -symbols $(OBJ)

$(OBJ)ProjectConfig.c: src/project/ProjectConfig.ec $(OBJ)ProjectConfig.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/project/ProjectConfig.ec -o $(OBJ)ProjectConfig.c -symbols $(OBJ)

$(OBJ)ProjectNode.c: src/project/ProjectNode.ec $(OBJ)ProjectNode.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/project/ProjectNode.ec -o $(OBJ)ProjectNode.c -symbols $(OBJ)

$(OBJ)ProjectView.c: src/project/ProjectView.ec $(OBJ)ProjectView.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/project/ProjectView.ec -o $(OBJ)ProjectView.c -symbols $(OBJ)

$(OBJ)Workspace.c: src/project/Workspace.ec $(OBJ)Workspace.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/project/Workspace.ec -o $(OBJ)Workspace.c -symbols $(OBJ)

ifdef WINDOWS_TARGET

$(OBJ)vsSupport.c: src/project/vsSupport.ec $(OBJ)vsSupport.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/project/vsSupport.ec -o $(OBJ)vsSupport.c -symbols $(OBJ)

endif

$(OBJ)CodeEditor.c: src/designer/CodeEditor.ec $(OBJ)CodeEditor.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/designer/CodeEditor.ec -o $(OBJ)CodeEditor.c -symbols $(OBJ)

$(OBJ)CodeObject.c: src/designer/CodeObject.ec $(OBJ)CodeObject.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/designer/CodeObject.ec -o $(OBJ)CodeObject.c -symbols $(OBJ)

$(OBJ)Designer.c: src/designer/Designer.ec $(OBJ)Designer.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/designer/Designer.ec -o $(OBJ)Designer.c -symbols $(OBJ)

$(OBJ)findCtx.c: src/designer/findCtx.ec $(OBJ)findCtx.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/designer/findCtx.ec -o $(OBJ)findCtx.c -symbols $(OBJ)

$(OBJ)findExp.c: src/designer/findExp.ec $(OBJ)findExp.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/designer/findExp.ec -o $(OBJ)findExp.c -symbols $(OBJ)

$(OBJ)findParams.c: src/designer/findParams.ec $(OBJ)findParams.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/designer/findParams.ec -o $(OBJ)findParams.c -symbols $(OBJ)

$(OBJ)Sheet.c: src/designer/Sheet.ec $(OBJ)Sheet.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/designer/Sheet.ec -o $(OBJ)Sheet.c -symbols $(OBJ)

$(OBJ)ToolBox.c: src/designer/ToolBox.ec $(OBJ)ToolBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/designer/ToolBox.ec -o $(OBJ)ToolBox.c -symbols $(OBJ)

$(OBJ)debugFindCtx.c: src/debugger/debugFindCtx.ec $(OBJ)debugFindCtx.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/debugger/debugFindCtx.ec -o $(OBJ)debugFindCtx.c -symbols $(OBJ)

$(OBJ)Debugger.c: src/debugger/Debugger.ec $(OBJ)Debugger.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/debugger/Debugger.ec -o $(OBJ)Debugger.c -symbols $(OBJ)

$(OBJ)debugTools.c: src/debugger/debugTools.ec $(OBJ)debugTools.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/debugger/debugTools.ec -o $(OBJ)debugTools.c -symbols $(OBJ)

$(OBJ)GDBDialog.c: src/debugger/GDBDialog.ec $(OBJ)GDBDialog.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/debugger/GDBDialog.ec -o $(OBJ)GDBDialog.c -symbols $(OBJ)

$(OBJ)process.c: src/debugger/process.ec $(OBJ)process.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/debugger/process.ec -o $(OBJ)process.c -symbols $(OBJ)

$(OBJ)BreakpointsView.c: src/panels/BreakpointsView.ec $(OBJ)BreakpointsView.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/panels/BreakpointsView.ec -o $(OBJ)BreakpointsView.c -symbols $(OBJ)

$(OBJ)CallStackView.c: src/panels/CallStackView.ec $(OBJ)CallStackView.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/panels/CallStackView.ec -o $(OBJ)CallStackView.c -symbols $(OBJ)

$(OBJ)OutputView.c: src/panels/OutputView.ec $(OBJ)OutputView.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/panels/OutputView.ec -o $(OBJ)OutputView.c -symbols $(OBJ)

$(OBJ)ThreadsView.c: src/panels/ThreadsView.ec $(OBJ)ThreadsView.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/panels/ThreadsView.ec -o $(OBJ)ThreadsView.c -symbols $(OBJ)

$(OBJ)WatchesView.c: src/panels/WatchesView.ec $(OBJ)WatchesView.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/panels/WatchesView.ec -o $(OBJ)WatchesView.c -symbols $(OBJ)

$(OBJ)ModelView.c: src/documents/ModelView.ec $(OBJ)ModelView.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/documents/ModelView.ec -o $(OBJ)ModelView.c -symbols $(OBJ)

$(OBJ)PictureEdit.c: src/documents/PictureEdit.ec $(OBJ)PictureEdit.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/documents/PictureEdit.ec -o $(OBJ)PictureEdit.c -symbols $(OBJ)

$(OBJ)about.c: src/about.ec $(OBJ)about.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/about.ec -o $(OBJ)about.c -symbols $(OBJ)

$(OBJ)ide.c: src/ide.ec $(OBJ)ide.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/ide.ec -o $(OBJ)ide.c -symbols $(OBJ)

$(OBJ)IDESettings.c: src/IDESettings.ec $(OBJ)IDESettings.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/IDESettings.ec -o $(OBJ)IDESettings.c -symbols $(OBJ)

$(OBJ)OldIDESettings.c: src/OldIDESettings.ec $(OBJ)OldIDESettings.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/OldIDESettings.ec -o $(OBJ)OldIDESettings.c -symbols $(OBJ)

$(OBJ)ProjectSettings.c: src/ProjectSettings.ec $(OBJ)ProjectSettings.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/ProjectSettings.ec -o $(OBJ)ProjectSettings.c -symbols $(OBJ)

$(OBJ)licensing.c: src/licensing.ec $(OBJ)licensing.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/licensing.ec -o $(OBJ)licensing.c -symbols $(OBJ)

# OBJECT RULES

$(OBJ)FileSystemIterator.o: $(OBJ)FileSystemIterator.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)FileSystemIterator.c -o $(OBJ)FileSystemIterator.o

$(OBJ)layout.o: $(OBJ)layout.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)layout.c -o $(OBJ)layout.o

$(OBJ)StringsBox.o: $(OBJ)StringsBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)StringsBox.c -o $(OBJ)StringsBox.o

$(OBJ)DynamicString.o: $(OBJ)DynamicString.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)DynamicString.c -o $(OBJ)DynamicString.o

$(OBJ)CompilersDetectionDialog.o: $(OBJ)CompilersDetectionDialog.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)CompilersDetectionDialog.c -o $(OBJ)CompilersDetectionDialog.o

$(OBJ)FindInFilesDialog.o: $(OBJ)FindInFilesDialog.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)FindInFilesDialog.c -o $(OBJ)FindInFilesDialog.o

$(OBJ)GlobalSettingsDialog.o: $(OBJ)GlobalSettingsDialog.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)GlobalSettingsDialog.c -o $(OBJ)GlobalSettingsDialog.o

$(OBJ)NewProjectDialog.o: $(OBJ)NewProjectDialog.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)NewProjectDialog.c -o $(OBJ)NewProjectDialog.o

$(OBJ)NodeProperties.o: $(OBJ)NodeProperties.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)NodeProperties.c -o $(OBJ)NodeProperties.o

$(OBJ)WorkspaceSettings.o: $(OBJ)WorkspaceSettings.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)WorkspaceSettings.c -o $(OBJ)WorkspaceSettings.o

$(OBJ)ProjectTabSettings.o: $(OBJ)ProjectTabSettings.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ProjectTabSettings.c -o $(OBJ)ProjectTabSettings.o

$(OBJ)Project.o: $(OBJ)Project.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Project.c -o $(OBJ)Project.o

$(OBJ)ProjectConfig.o: $(OBJ)ProjectConfig.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ProjectConfig.c -o $(OBJ)ProjectConfig.o

$(OBJ)ProjectNode.o: $(OBJ)ProjectNode.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ProjectNode.c -o $(OBJ)ProjectNode.o

$(OBJ)ProjectView.o: $(OBJ)ProjectView.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ProjectView.c -o $(OBJ)ProjectView.o

$(OBJ)Workspace.o: $(OBJ)Workspace.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Workspace.c -o $(OBJ)Workspace.o

$(OBJ)vsSupport.o: $(OBJ)vsSupport.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)vsSupport.c -o $(OBJ)vsSupport.o

$(OBJ)CodeEditor.o: $(OBJ)CodeEditor.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)CodeEditor.c -o $(OBJ)CodeEditor.o

$(OBJ)CodeObject.o: $(OBJ)CodeObject.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)CodeObject.c -o $(OBJ)CodeObject.o

$(OBJ)Designer.o: $(OBJ)Designer.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Designer.c -o $(OBJ)Designer.o

$(OBJ)findCtx.o: $(OBJ)findCtx.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)findCtx.c -o $(OBJ)findCtx.o

$(OBJ)findExp.o: $(OBJ)findExp.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)findExp.c -o $(OBJ)findExp.o

$(OBJ)findParams.o: $(OBJ)findParams.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)findParams.c -o $(OBJ)findParams.o

$(OBJ)Sheet.o: $(OBJ)Sheet.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Sheet.c -o $(OBJ)Sheet.o

$(OBJ)ToolBox.o: $(OBJ)ToolBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ToolBox.c -o $(OBJ)ToolBox.o

$(OBJ)debugFindCtx.o: $(OBJ)debugFindCtx.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)debugFindCtx.c -o $(OBJ)debugFindCtx.o

$(OBJ)Debugger.o: $(OBJ)Debugger.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)Debugger.c -o $(OBJ)Debugger.o

$(OBJ)debugTools.o: $(OBJ)debugTools.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)debugTools.c -o $(OBJ)debugTools.o

$(OBJ)GDBDialog.o: $(OBJ)GDBDialog.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)GDBDialog.c -o $(OBJ)GDBDialog.o

$(OBJ)process.o: $(OBJ)process.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)process.c -o $(OBJ)process.o

$(OBJ)BreakpointsView.o: $(OBJ)BreakpointsView.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)BreakpointsView.c -o $(OBJ)BreakpointsView.o

$(OBJ)CallStackView.o: $(OBJ)CallStackView.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)CallStackView.c -o $(OBJ)CallStackView.o

$(OBJ)OutputView.o: $(OBJ)OutputView.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)OutputView.c -o $(OBJ)OutputView.o

$(OBJ)ThreadsView.o: $(OBJ)ThreadsView.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ThreadsView.c -o $(OBJ)ThreadsView.o

$(OBJ)WatchesView.o: $(OBJ)WatchesView.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)WatchesView.c -o $(OBJ)WatchesView.o

$(OBJ)ModelView.o: $(OBJ)ModelView.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ModelView.c -o $(OBJ)ModelView.o

$(OBJ)PictureEdit.o: $(OBJ)PictureEdit.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)PictureEdit.c -o $(OBJ)PictureEdit.o

$(OBJ)about.o: $(OBJ)about.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)about.c -o $(OBJ)about.o

$(OBJ)ide.o: $(OBJ)ide.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ide.c -o $(OBJ)ide.o

$(OBJ)IDESettings.o: $(OBJ)IDESettings.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)IDESettings.c -o $(OBJ)IDESettings.o

$(OBJ)OldIDESettings.o: $(OBJ)OldIDESettings.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)OldIDESettings.c -o $(OBJ)OldIDESettings.o

$(OBJ)ProjectSettings.o: $(OBJ)ProjectSettings.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ProjectSettings.c -o $(OBJ)ProjectSettings.o

$(OBJ)licensing.o: $(OBJ)licensing.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)licensing.c -o $(OBJ)licensing.o

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
