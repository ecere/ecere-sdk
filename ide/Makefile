.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := ide
CONFIG := release
COMPILER := default
TARGET_TYPE = executable

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = res/

CONSOLE = -mwindows

TARGET = obj/$(CONFIG).$(PLATFORM)/ide$(E)

OBJECTS = \
	$(OBJ)FileSystemIterator.o \
	$(OBJ)layout.o \
	$(OBJ)StringsBox.o \
	$(OBJ)ActiveCompilerDialog.o \
	$(OBJ)CompilersDetectionDialog.o \
	$(OBJ)FindInFilesDialog.o \
	$(OBJ)GlobalSettingsDialog.o \
	$(OBJ)NewProjectDialog.o \
	$(OBJ)NodeProperties.o \
	$(OBJ)ProjectActiveConfig.o \
	$(OBJ)WorkspaceSettings.o \
	$(OBJ)ProjectTabSettings.o \
	$(OBJ)Project.o \
	$(OBJ)ProjectConfig.o \
	$(OBJ)ProjectNode.o \
	$(OBJ)ProjectView.o \
	$(OBJ)Workspace.o \
	$(if $(WINDOWS),$(OBJ)vsSupport.o,) \
	$(OBJ)CodeEditor.o \
	$(OBJ)CodeObject.o \
	$(OBJ)Designer.o \
	$(OBJ)findCtx.o \
	$(OBJ)findExp.o \
	$(OBJ)findParams.o \
	$(OBJ)Sheet.o \
	$(OBJ)ToolBox.o \
	$(OBJ)debugFindCtx.o \
	$(OBJ)Debugger.o \
	$(OBJ)debugTools.o \
	$(OBJ)GDBDialog.o \
	$(OBJ)process.o \
	$(OBJ)BreakpointsView.o \
	$(OBJ)CallStackView.o \
	$(OBJ)OutputView.o \
	$(OBJ)ThreadsView.o \
	$(OBJ)WatchesView.o \
	$(OBJ)ModelView.o \
	$(OBJ)PictureEdit.o \
	$(OBJ)about.o \
	$(OBJ)ide.o \
	$(OBJ)IDESettings.o \
	$(OBJ)OldIDESettings.o \
	$(OBJ)ProjectSettings.o \
	$(OBJ)$(MODULE).main$(O)

COBJECTS = \
	$(OBJ)FileSystemIterator.c \
	$(OBJ)layout.c \
	$(OBJ)StringsBox.c \
	$(OBJ)ActiveCompilerDialog.c \
	$(OBJ)CompilersDetectionDialog.c \
	$(OBJ)FindInFilesDialog.c \
	$(OBJ)GlobalSettingsDialog.c \
	$(OBJ)NewProjectDialog.c \
	$(OBJ)NodeProperties.c \
	$(OBJ)ProjectActiveConfig.c \
	$(OBJ)WorkspaceSettings.c \
	$(OBJ)ProjectTabSettings.c \
	$(OBJ)Project.c \
	$(OBJ)ProjectConfig.c \
	$(OBJ)ProjectNode.c \
	$(OBJ)ProjectView.c \
	$(OBJ)Workspace.c \
	$(if $(WINDOWS),$(OBJ)vsSupport.c,) \
	$(OBJ)CodeEditor.c \
	$(OBJ)CodeObject.c \
	$(OBJ)Designer.c \
	$(OBJ)findCtx.c \
	$(OBJ)findExp.c \
	$(OBJ)findParams.c \
	$(OBJ)Sheet.c \
	$(OBJ)ToolBox.c \
	$(OBJ)debugFindCtx.c \
	$(OBJ)Debugger.c \
	$(OBJ)debugTools.c \
	$(OBJ)GDBDialog.c \
	$(OBJ)process.c \
	$(OBJ)BreakpointsView.c \
	$(OBJ)CallStackView.c \
	$(OBJ)OutputView.c \
	$(OBJ)ThreadsView.c \
	$(OBJ)WatchesView.c \
	$(OBJ)ModelView.c \
	$(OBJ)PictureEdit.c \
	$(OBJ)about.c \
	$(OBJ)ide.c \
	$(OBJ)IDESettings.c \
	$(OBJ)OldIDESettings.c \
	$(OBJ)ProjectSettings.c

SYMBOLS = $(SYMBOLS1) $(SYMBOLS2)
SYMBOLS1 = \
	$(OBJ)FileSystemIterator.sym \
	$(OBJ)layout.sym \
	$(OBJ)StringsBox.sym \
	$(OBJ)ActiveCompilerDialog.sym \
	$(OBJ)CompilersDetectionDialog.sym \
	$(OBJ)FindInFilesDialog.sym \
	$(OBJ)GlobalSettingsDialog.sym \
	$(OBJ)NewProjectDialog.sym \
	$(OBJ)NodeProperties.sym \
	$(OBJ)ProjectActiveConfig.sym \
	$(OBJ)WorkspaceSettings.sym \
	$(OBJ)ProjectTabSettings.sym \
	$(OBJ)Project.sym \
	$(OBJ)ProjectConfig.sym \
	$(OBJ)ProjectNode.sym \
	$(OBJ)ProjectView.sym \
	$(OBJ)Workspace.sym \
	$(if $(WINDOWS),$(OBJ)vsSupport.sym,) \
	$(OBJ)CodeEditor.sym \
	$(OBJ)CodeObject.sym \
	$(OBJ)Designer.sym \
	$(OBJ)findCtx.sym \
	$(OBJ)findExp.sym \
	$(OBJ)findParams.sym \
	$(OBJ)Sheet.sym \
	$(OBJ)ToolBox.sym \
	$(OBJ)debugFindCtx.sym \
	$(OBJ)Debugger.sym \
	$(OBJ)debugTools.sym \
	$(OBJ)GDBDialog.sym \
	$(OBJ)process.sym \
	$(OBJ)BreakpointsView.sym \
	$(OBJ)CallStackView.sym \
	$(OBJ)OutputView.sym \
	$(OBJ)ThreadsView.sym \
	$(OBJ)WatchesView.sym \
	$(OBJ)ModelView.sym \
	$(OBJ)PictureEdit.sym \
	$(OBJ)about.sym \
	$(OBJ)ide.sym \
	$(OBJ)IDESettings.sym \
	$(OBJ)OldIDESettings.sym
SYMBOLS2 = \
	$(OBJ)ProjectSettings.sym

IMPORTS = $(IMPORTS1) $(IMPORTS2)
IMPORTS1 = \
	$(OBJ)FileSystemIterator.imp \
	$(OBJ)layout.imp \
	$(OBJ)StringsBox.imp \
	$(OBJ)ActiveCompilerDialog.imp \
	$(OBJ)CompilersDetectionDialog.imp \
	$(OBJ)FindInFilesDialog.imp \
	$(OBJ)GlobalSettingsDialog.imp \
	$(OBJ)NewProjectDialog.imp \
	$(OBJ)NodeProperties.imp \
	$(OBJ)ProjectActiveConfig.imp \
	$(OBJ)WorkspaceSettings.imp \
	$(OBJ)ProjectTabSettings.imp \
	$(OBJ)Project.imp \
	$(OBJ)ProjectConfig.imp \
	$(OBJ)ProjectNode.imp \
	$(OBJ)ProjectView.imp \
	$(OBJ)Workspace.imp \
	$(if $(WINDOWS),$(OBJ)vsSupport.imp,) \
	$(OBJ)CodeEditor.imp \
	$(OBJ)CodeObject.imp \
	$(OBJ)Designer.imp \
	$(OBJ)findCtx.imp \
	$(OBJ)findExp.imp \
	$(OBJ)findParams.imp \
	$(OBJ)Sheet.imp \
	$(OBJ)ToolBox.imp \
	$(OBJ)debugFindCtx.imp \
	$(OBJ)Debugger.imp \
	$(OBJ)debugTools.imp \
	$(OBJ)GDBDialog.imp \
	$(OBJ)process.imp \
	$(OBJ)BreakpointsView.imp \
	$(OBJ)CallStackView.imp \
	$(OBJ)OutputView.imp \
	$(OBJ)ThreadsView.imp \
	$(OBJ)WatchesView.imp \
	$(OBJ)ModelView.imp \
	$(OBJ)PictureEdit.imp \
	$(OBJ)about.imp \
	$(OBJ)ide.imp \
	$(OBJ)IDESettings.imp \
	$(OBJ)OldIDESettings.imp
IMPORTS2 = \
	$(OBJ)ProjectSettings.imp

SOURCES = \
	../extras/FileSystemIterator.ec \
	../extras/gui/layout.ec \
	../extras/gui/controls/StringsBox.ec \
	src/dialogs/ActiveCompilerDialog.ec \
	src/dialogs/CompilersDetectionDialog.ec \
	src/dialogs/FindInFilesDialog.ec \
	src/dialogs/GlobalSettingsDialog.ec \
	src/dialogs/NewProjectDialog.ec \
	src/dialogs/NodeProperties.ec \
	src/dialogs/ProjectActiveConfig.ec \
	src/dialogs/WorkspaceSettings.ec \
	src/dialogs/ProjectTabSettings.ec \
	src/project/Project.ec \
	src/project/ProjectConfig.ec \
	src/project/ProjectNode.ec \
	src/project/ProjectView.ec \
	src/project/Workspace.ec \
	$(if $(WINDOWS),src/project/vsSupport.ec,) \
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
	src/ProjectSettings.ec

RESOURCES = \
	$(RES)actions/attach.png \
	$(RES)actions/delete.png \
	$(RES)actions/detach.png \
	$(RES)actions/docNew.png \
	$(RES)actions/editCopy.png \
	$(RES)actions/editDelete.png \
	$(RES)actions/delete2.png \
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
	res/ecere.jpg \
	res/ecereBack.jpg \
	res/icon.png \
	../include.mk

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

# PLATFORM-SPECIFIC OPTIONS

ifdef WINDOWS

LIBS += obj/resources.o

else
ifdef LINUX

OFLAGS += \
	 -L/usr/X11R6/lib

LIBS += -lX11

else
ifdef OSX

OFLAGS += \
	 -L/usr/X11R6/lib

LIBS += -lX11

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
ifdef WINDOWS
$(TARGET): obj/resources.o
endif
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
	$(STRIP) $(STRIPOPT) $(TARGET)
	$(EAR) awq $(TARGET) res/ecere.jpg res/ecereBack.jpg res/icon.png ../include.mk ""
	$(EAR) awq $(TARGET) $(RES)actions/attach.png $(RES)actions/delete.png $(RES)actions/detach.png $(RES)actions/docNew.png $(RES)actions/editCopy.png $(RES)actions/editDelete.png $(RES)actions/delete2.png "actions"
	$(EAR) awq $(TARGET) $(RES)codeMarks/breakpoint.png $(RES)codeMarks/breakpointDisabled.png $(RES)codeMarks/breakpointHalf.png $(RES)codeMarks/breakpointHalfDisabled.png $(RES)codeMarks/cursor.png $(RES)codeMarks/cursorError.png $(RES)codeMarks/topFrame.png $(RES)codeMarks/topFrameError.png $(RES)codeMarks/topFrameHalf.png $(RES)codeMarks/topFrameHalfError.png "codeMarks"
	$(EAR) awq $(TARGET) $(RES)others/mousePointer.png "others"
	$(EAR) awq $(TARGET) locale/zh_CN/LC_MESSAGES/ide.mo "locale/zh_CN/LC_MESSAGES"
	$(EAR) awq $(TARGET) locale/es_ES/LC_MESSAGES/ide.mo "locale/es_ES/LC_MESSAGES"
	$(call cpq,$(TARGET),../obj/$(PLATFORM)/bin/)

ifdef WINDOWS
obj/resources.o: src/icon2.ico src/resources.rc | objdir
	windres src/resources.rc obj/resources.o
endif

# SYMBOL RULES

$(OBJ)FileSystemIterator.sym: ../extras/FileSystemIterator.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../extras/FileSystemIterator.ec -o $(OBJ)FileSystemIterator.sym

$(OBJ)layout.sym: ../extras/gui/layout.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../extras/gui/layout.ec -o $(OBJ)layout.sym

$(OBJ)StringsBox.sym: ../extras/gui/controls/StringsBox.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../extras/gui/controls/StringsBox.ec -o $(OBJ)StringsBox.sym

$(OBJ)ActiveCompilerDialog.sym: src/dialogs/ActiveCompilerDialog.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/dialogs/ActiveCompilerDialog.ec -o $(OBJ)ActiveCompilerDialog.sym

$(OBJ)CompilersDetectionDialog.sym: src/dialogs/CompilersDetectionDialog.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/dialogs/CompilersDetectionDialog.ec -o $(OBJ)CompilersDetectionDialog.sym

$(OBJ)FindInFilesDialog.sym: src/dialogs/FindInFilesDialog.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/dialogs/FindInFilesDialog.ec -o $(OBJ)FindInFilesDialog.sym

$(OBJ)GlobalSettingsDialog.sym: src/dialogs/GlobalSettingsDialog.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/dialogs/GlobalSettingsDialog.ec -o $(OBJ)GlobalSettingsDialog.sym

$(OBJ)NewProjectDialog.sym: src/dialogs/NewProjectDialog.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/dialogs/NewProjectDialog.ec -o $(OBJ)NewProjectDialog.sym

$(OBJ)NodeProperties.sym: src/dialogs/NodeProperties.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/dialogs/NodeProperties.ec -o $(OBJ)NodeProperties.sym

$(OBJ)ProjectActiveConfig.sym: src/dialogs/ProjectActiveConfig.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/dialogs/ProjectActiveConfig.ec -o $(OBJ)ProjectActiveConfig.sym

$(OBJ)WorkspaceSettings.sym: src/dialogs/WorkspaceSettings.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/dialogs/WorkspaceSettings.ec -o $(OBJ)WorkspaceSettings.sym

$(OBJ)ProjectTabSettings.sym: src/dialogs/ProjectTabSettings.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/dialogs/ProjectTabSettings.ec -o $(OBJ)ProjectTabSettings.sym

$(OBJ)Project.sym: src/project/Project.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/project/Project.ec -o $(OBJ)Project.sym

$(OBJ)ProjectConfig.sym: src/project/ProjectConfig.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/project/ProjectConfig.ec -o $(OBJ)ProjectConfig.sym

$(OBJ)ProjectNode.sym: src/project/ProjectNode.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/project/ProjectNode.ec -o $(OBJ)ProjectNode.sym

$(OBJ)ProjectView.sym: src/project/ProjectView.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/project/ProjectView.ec -o $(OBJ)ProjectView.sym

$(OBJ)Workspace.sym: src/project/Workspace.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/project/Workspace.ec -o $(OBJ)Workspace.sym

$(OBJ)vsSupport.sym: src/project/vsSupport.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/project/vsSupport.ec -o $(OBJ)vsSupport.sym

$(OBJ)CodeEditor.sym: src/designer/CodeEditor.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/designer/CodeEditor.ec -o $(OBJ)CodeEditor.sym

$(OBJ)CodeObject.sym: src/designer/CodeObject.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/designer/CodeObject.ec -o $(OBJ)CodeObject.sym

$(OBJ)Designer.sym: src/designer/Designer.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/designer/Designer.ec -o $(OBJ)Designer.sym

$(OBJ)findCtx.sym: src/designer/findCtx.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/designer/findCtx.ec -o $(OBJ)findCtx.sym

$(OBJ)findExp.sym: src/designer/findExp.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/designer/findExp.ec -o $(OBJ)findExp.sym

$(OBJ)findParams.sym: src/designer/findParams.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/designer/findParams.ec -o $(OBJ)findParams.sym

$(OBJ)Sheet.sym: src/designer/Sheet.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/designer/Sheet.ec -o $(OBJ)Sheet.sym

$(OBJ)ToolBox.sym: src/designer/ToolBox.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/designer/ToolBox.ec -o $(OBJ)ToolBox.sym

$(OBJ)debugFindCtx.sym: src/debugger/debugFindCtx.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/debugger/debugFindCtx.ec -o $(OBJ)debugFindCtx.sym

$(OBJ)Debugger.sym: src/debugger/Debugger.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/debugger/Debugger.ec -o $(OBJ)Debugger.sym

$(OBJ)debugTools.sym: src/debugger/debugTools.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/debugger/debugTools.ec -o $(OBJ)debugTools.sym

$(OBJ)GDBDialog.sym: src/debugger/GDBDialog.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/debugger/GDBDialog.ec -o $(OBJ)GDBDialog.sym

$(OBJ)process.sym: src/debugger/process.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/debugger/process.ec -o $(OBJ)process.sym

$(OBJ)BreakpointsView.sym: src/panels/BreakpointsView.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/panels/BreakpointsView.ec -o $(OBJ)BreakpointsView.sym

$(OBJ)CallStackView.sym: src/panels/CallStackView.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/panels/CallStackView.ec -o $(OBJ)CallStackView.sym

$(OBJ)OutputView.sym: src/panels/OutputView.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/panels/OutputView.ec -o $(OBJ)OutputView.sym

$(OBJ)ThreadsView.sym: src/panels/ThreadsView.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/panels/ThreadsView.ec -o $(OBJ)ThreadsView.sym

$(OBJ)WatchesView.sym: src/panels/WatchesView.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/panels/WatchesView.ec -o $(OBJ)WatchesView.sym

$(OBJ)ModelView.sym: src/documents/ModelView.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/documents/ModelView.ec -o $(OBJ)ModelView.sym

$(OBJ)PictureEdit.sym: src/documents/PictureEdit.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/documents/PictureEdit.ec -o $(OBJ)PictureEdit.sym

$(OBJ)about.sym: src/about.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/about.ec -o $(OBJ)about.sym

$(OBJ)ide.sym: src/ide.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/ide.ec -o $(OBJ)ide.sym

$(OBJ)IDESettings.sym: src/IDESettings.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/IDESettings.ec -o $(OBJ)IDESettings.sym

$(OBJ)OldIDESettings.sym: src/OldIDESettings.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/OldIDESettings.ec -o $(OBJ)OldIDESettings.sym

$(OBJ)ProjectSettings.sym: src/ProjectSettings.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/ProjectSettings.ec -o $(OBJ)ProjectSettings.sym

# C OBJECT RULES

$(OBJ)FileSystemIterator.c: ../extras/FileSystemIterator.ec $(OBJ)FileSystemIterator.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../extras/FileSystemIterator.ec -o $(OBJ)FileSystemIterator.c -symbols $(OBJ)

$(OBJ)layout.c: ../extras/gui/layout.ec $(OBJ)layout.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../extras/gui/layout.ec -o $(OBJ)layout.c -symbols $(OBJ)

$(OBJ)StringsBox.c: ../extras/gui/controls/StringsBox.ec $(OBJ)StringsBox.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../extras/gui/controls/StringsBox.ec -o $(OBJ)StringsBox.c -symbols $(OBJ)

$(OBJ)ActiveCompilerDialog.c: src/dialogs/ActiveCompilerDialog.ec $(OBJ)ActiveCompilerDialog.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/dialogs/ActiveCompilerDialog.ec -o $(OBJ)ActiveCompilerDialog.c -symbols $(OBJ)

$(OBJ)CompilersDetectionDialog.c: src/dialogs/CompilersDetectionDialog.ec $(OBJ)CompilersDetectionDialog.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/dialogs/CompilersDetectionDialog.ec -o $(OBJ)CompilersDetectionDialog.c -symbols $(OBJ)

$(OBJ)FindInFilesDialog.c: src/dialogs/FindInFilesDialog.ec $(OBJ)FindInFilesDialog.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/dialogs/FindInFilesDialog.ec -o $(OBJ)FindInFilesDialog.c -symbols $(OBJ)

$(OBJ)GlobalSettingsDialog.c: src/dialogs/GlobalSettingsDialog.ec $(OBJ)GlobalSettingsDialog.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/dialogs/GlobalSettingsDialog.ec -o $(OBJ)GlobalSettingsDialog.c -symbols $(OBJ)

$(OBJ)NewProjectDialog.c: src/dialogs/NewProjectDialog.ec $(OBJ)NewProjectDialog.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/dialogs/NewProjectDialog.ec -o $(OBJ)NewProjectDialog.c -symbols $(OBJ)

$(OBJ)NodeProperties.c: src/dialogs/NodeProperties.ec $(OBJ)NodeProperties.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/dialogs/NodeProperties.ec -o $(OBJ)NodeProperties.c -symbols $(OBJ)

$(OBJ)ProjectActiveConfig.c: src/dialogs/ProjectActiveConfig.ec $(OBJ)ProjectActiveConfig.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/dialogs/ProjectActiveConfig.ec -o $(OBJ)ProjectActiveConfig.c -symbols $(OBJ)

$(OBJ)WorkspaceSettings.c: src/dialogs/WorkspaceSettings.ec $(OBJ)WorkspaceSettings.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/dialogs/WorkspaceSettings.ec -o $(OBJ)WorkspaceSettings.c -symbols $(OBJ)

$(OBJ)ProjectTabSettings.c: src/dialogs/ProjectTabSettings.ec $(OBJ)ProjectTabSettings.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/dialogs/ProjectTabSettings.ec -o $(OBJ)ProjectTabSettings.c -symbols $(OBJ)

$(OBJ)Project.c: src/project/Project.ec $(OBJ)Project.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/project/Project.ec -o $(OBJ)Project.c -symbols $(OBJ)

$(OBJ)ProjectConfig.c: src/project/ProjectConfig.ec $(OBJ)ProjectConfig.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/project/ProjectConfig.ec -o $(OBJ)ProjectConfig.c -symbols $(OBJ)

$(OBJ)ProjectNode.c: src/project/ProjectNode.ec $(OBJ)ProjectNode.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/project/ProjectNode.ec -o $(OBJ)ProjectNode.c -symbols $(OBJ)

$(OBJ)ProjectView.c: src/project/ProjectView.ec $(OBJ)ProjectView.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/project/ProjectView.ec -o $(OBJ)ProjectView.c -symbols $(OBJ)

$(OBJ)Workspace.c: src/project/Workspace.ec $(OBJ)Workspace.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/project/Workspace.ec -o $(OBJ)Workspace.c -symbols $(OBJ)

$(OBJ)vsSupport.c: src/project/vsSupport.ec $(OBJ)vsSupport.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/project/vsSupport.ec -o $(OBJ)vsSupport.c -symbols $(OBJ)

$(OBJ)CodeEditor.c: src/designer/CodeEditor.ec $(OBJ)CodeEditor.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/designer/CodeEditor.ec -o $(OBJ)CodeEditor.c -symbols $(OBJ)

$(OBJ)CodeObject.c: src/designer/CodeObject.ec $(OBJ)CodeObject.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/designer/CodeObject.ec -o $(OBJ)CodeObject.c -symbols $(OBJ)

$(OBJ)Designer.c: src/designer/Designer.ec $(OBJ)Designer.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/designer/Designer.ec -o $(OBJ)Designer.c -symbols $(OBJ)

$(OBJ)findCtx.c: src/designer/findCtx.ec $(OBJ)findCtx.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/designer/findCtx.ec -o $(OBJ)findCtx.c -symbols $(OBJ)

$(OBJ)findExp.c: src/designer/findExp.ec $(OBJ)findExp.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/designer/findExp.ec -o $(OBJ)findExp.c -symbols $(OBJ)

$(OBJ)findParams.c: src/designer/findParams.ec $(OBJ)findParams.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/designer/findParams.ec -o $(OBJ)findParams.c -symbols $(OBJ)

$(OBJ)Sheet.c: src/designer/Sheet.ec $(OBJ)Sheet.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/designer/Sheet.ec -o $(OBJ)Sheet.c -symbols $(OBJ)

$(OBJ)ToolBox.c: src/designer/ToolBox.ec $(OBJ)ToolBox.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/designer/ToolBox.ec -o $(OBJ)ToolBox.c -symbols $(OBJ)

$(OBJ)debugFindCtx.c: src/debugger/debugFindCtx.ec $(OBJ)debugFindCtx.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/debugger/debugFindCtx.ec -o $(OBJ)debugFindCtx.c -symbols $(OBJ)

$(OBJ)Debugger.c: src/debugger/Debugger.ec $(OBJ)Debugger.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/debugger/Debugger.ec -o $(OBJ)Debugger.c -symbols $(OBJ)

$(OBJ)debugTools.c: src/debugger/debugTools.ec $(OBJ)debugTools.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/debugger/debugTools.ec -o $(OBJ)debugTools.c -symbols $(OBJ)

$(OBJ)GDBDialog.c: src/debugger/GDBDialog.ec $(OBJ)GDBDialog.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/debugger/GDBDialog.ec -o $(OBJ)GDBDialog.c -symbols $(OBJ)

$(OBJ)process.c: src/debugger/process.ec $(OBJ)process.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/debugger/process.ec -o $(OBJ)process.c -symbols $(OBJ)

$(OBJ)BreakpointsView.c: src/panels/BreakpointsView.ec $(OBJ)BreakpointsView.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/panels/BreakpointsView.ec -o $(OBJ)BreakpointsView.c -symbols $(OBJ)

$(OBJ)CallStackView.c: src/panels/CallStackView.ec $(OBJ)CallStackView.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/panels/CallStackView.ec -o $(OBJ)CallStackView.c -symbols $(OBJ)

$(OBJ)OutputView.c: src/panels/OutputView.ec $(OBJ)OutputView.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/panels/OutputView.ec -o $(OBJ)OutputView.c -symbols $(OBJ)

$(OBJ)ThreadsView.c: src/panels/ThreadsView.ec $(OBJ)ThreadsView.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/panels/ThreadsView.ec -o $(OBJ)ThreadsView.c -symbols $(OBJ)

$(OBJ)WatchesView.c: src/panels/WatchesView.ec $(OBJ)WatchesView.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/panels/WatchesView.ec -o $(OBJ)WatchesView.c -symbols $(OBJ)

$(OBJ)ModelView.c: src/documents/ModelView.ec $(OBJ)ModelView.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/documents/ModelView.ec -o $(OBJ)ModelView.c -symbols $(OBJ)

$(OBJ)PictureEdit.c: src/documents/PictureEdit.ec $(OBJ)PictureEdit.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/documents/PictureEdit.ec -o $(OBJ)PictureEdit.c -symbols $(OBJ)

$(OBJ)about.c: src/about.ec $(OBJ)about.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/about.ec -o $(OBJ)about.c -symbols $(OBJ)

$(OBJ)ide.c: src/ide.ec $(OBJ)ide.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/ide.ec -o $(OBJ)ide.c -symbols $(OBJ)

$(OBJ)IDESettings.c: src/IDESettings.ec $(OBJ)IDESettings.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/IDESettings.ec -o $(OBJ)IDESettings.c -symbols $(OBJ)

$(OBJ)OldIDESettings.c: src/OldIDESettings.ec $(OBJ)OldIDESettings.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/OldIDESettings.ec -o $(OBJ)OldIDESettings.c -symbols $(OBJ)

$(OBJ)ProjectSettings.c: src/ProjectSettings.ec $(OBJ)ProjectSettings.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/ProjectSettings.ec -o $(OBJ)ProjectSettings.c -symbols $(OBJ)

# OBJECT RULES

$(OBJ)FileSystemIterator.o: $(OBJ)FileSystemIterator.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)FileSystemIterator.c -o $(OBJ)FileSystemIterator.o

$(OBJ)layout.o: $(OBJ)layout.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)layout.c -o $(OBJ)layout.o

$(OBJ)StringsBox.o: $(OBJ)StringsBox.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)StringsBox.c -o $(OBJ)StringsBox.o

$(OBJ)ActiveCompilerDialog.o: $(OBJ)ActiveCompilerDialog.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ActiveCompilerDialog.c -o $(OBJ)ActiveCompilerDialog.o

$(OBJ)CompilersDetectionDialog.o: $(OBJ)CompilersDetectionDialog.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)CompilersDetectionDialog.c -o $(OBJ)CompilersDetectionDialog.o

$(OBJ)FindInFilesDialog.o: $(OBJ)FindInFilesDialog.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)FindInFilesDialog.c -o $(OBJ)FindInFilesDialog.o

$(OBJ)GlobalSettingsDialog.o: $(OBJ)GlobalSettingsDialog.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)GlobalSettingsDialog.c -o $(OBJ)GlobalSettingsDialog.o

$(OBJ)NewProjectDialog.o: $(OBJ)NewProjectDialog.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)NewProjectDialog.c -o $(OBJ)NewProjectDialog.o

$(OBJ)NodeProperties.o: $(OBJ)NodeProperties.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)NodeProperties.c -o $(OBJ)NodeProperties.o

$(OBJ)ProjectActiveConfig.o: $(OBJ)ProjectActiveConfig.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ProjectActiveConfig.c -o $(OBJ)ProjectActiveConfig.o

$(OBJ)WorkspaceSettings.o: $(OBJ)WorkspaceSettings.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)WorkspaceSettings.c -o $(OBJ)WorkspaceSettings.o

$(OBJ)ProjectTabSettings.o: $(OBJ)ProjectTabSettings.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ProjectTabSettings.c -o $(OBJ)ProjectTabSettings.o

$(OBJ)Project.o: $(OBJ)Project.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Project.c -o $(OBJ)Project.o

$(OBJ)ProjectConfig.o: $(OBJ)ProjectConfig.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ProjectConfig.c -o $(OBJ)ProjectConfig.o

$(OBJ)ProjectNode.o: $(OBJ)ProjectNode.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ProjectNode.c -o $(OBJ)ProjectNode.o

$(OBJ)ProjectView.o: $(OBJ)ProjectView.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ProjectView.c -o $(OBJ)ProjectView.o

$(OBJ)Workspace.o: $(OBJ)Workspace.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Workspace.c -o $(OBJ)Workspace.o

$(OBJ)vsSupport.o: $(OBJ)vsSupport.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)vsSupport.c -o $(OBJ)vsSupport.o

$(OBJ)CodeEditor.o: $(OBJ)CodeEditor.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)CodeEditor.c -o $(OBJ)CodeEditor.o

$(OBJ)CodeObject.o: $(OBJ)CodeObject.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)CodeObject.c -o $(OBJ)CodeObject.o

$(OBJ)Designer.o: $(OBJ)Designer.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Designer.c -o $(OBJ)Designer.o

$(OBJ)findCtx.o: $(OBJ)findCtx.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)findCtx.c -o $(OBJ)findCtx.o

$(OBJ)findExp.o: $(OBJ)findExp.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)findExp.c -o $(OBJ)findExp.o

$(OBJ)findParams.o: $(OBJ)findParams.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)findParams.c -o $(OBJ)findParams.o

$(OBJ)Sheet.o: $(OBJ)Sheet.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Sheet.c -o $(OBJ)Sheet.o

$(OBJ)ToolBox.o: $(OBJ)ToolBox.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ToolBox.c -o $(OBJ)ToolBox.o

$(OBJ)debugFindCtx.o: $(OBJ)debugFindCtx.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)debugFindCtx.c -o $(OBJ)debugFindCtx.o

$(OBJ)Debugger.o: $(OBJ)Debugger.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)Debugger.c -o $(OBJ)Debugger.o

$(OBJ)debugTools.o: $(OBJ)debugTools.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)debugTools.c -o $(OBJ)debugTools.o

$(OBJ)GDBDialog.o: $(OBJ)GDBDialog.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)GDBDialog.c -o $(OBJ)GDBDialog.o

$(OBJ)process.o: $(OBJ)process.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)process.c -o $(OBJ)process.o

$(OBJ)BreakpointsView.o: $(OBJ)BreakpointsView.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)BreakpointsView.c -o $(OBJ)BreakpointsView.o

$(OBJ)CallStackView.o: $(OBJ)CallStackView.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)CallStackView.c -o $(OBJ)CallStackView.o

$(OBJ)OutputView.o: $(OBJ)OutputView.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)OutputView.c -o $(OBJ)OutputView.o

$(OBJ)ThreadsView.o: $(OBJ)ThreadsView.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ThreadsView.c -o $(OBJ)ThreadsView.o

$(OBJ)WatchesView.o: $(OBJ)WatchesView.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)WatchesView.c -o $(OBJ)WatchesView.o

$(OBJ)ModelView.o: $(OBJ)ModelView.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ModelView.c -o $(OBJ)ModelView.o

$(OBJ)PictureEdit.o: $(OBJ)PictureEdit.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)PictureEdit.c -o $(OBJ)PictureEdit.o

$(OBJ)about.o: $(OBJ)about.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)about.c -o $(OBJ)about.o

$(OBJ)ide.o: $(OBJ)ide.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ide.c -o $(OBJ)ide.o

$(OBJ)IDESettings.o: $(OBJ)IDESettings.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)IDESettings.c -o $(OBJ)IDESettings.o

$(OBJ)OldIDESettings.o: $(OBJ)OldIDESettings.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)OldIDESettings.c -o $(OBJ)OldIDESettings.o

$(OBJ)ProjectSettings.o: $(OBJ)ProjectSettings.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ProjectSettings.c -o $(OBJ)ProjectSettings.o

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.c -o $(OBJ)$(MODULE).main$(O)

clean: objdir
	$(call rmq,$(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S) $(TARGET))
	$(call rmq,$(OBJECTS))
	$(call rmq,$(COBJECTS))
	$(call rmq,$(IMPORTS1))
	$(call rmq,$(IMPORTS2))
	$(call rmq,$(SYMBOLS1))
	$(call rmq,$(SYMBOLS2))

realclean:
	$(call rmrq,$(OBJ))

distclean:
	$(call rmrq,obj/)
