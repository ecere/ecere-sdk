.PHONY: all objdir cleantarget clean realclean distclean

# CORE VARIABLES

MODULE := EDA
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

_CF_DIR = ../../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES = 

ifdef LINUX_TARGET
TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDA$(SO).0.44
SONAME = -Wl,-soname,$(LP)EDA$(SO).0
else
TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDA$(SO)
SONAME =
endif

_ECSOURCES = \
	src/DirFilesDataSource.ec \
	src/EDB.ec \
	src/MemoryEDB.ec \
	src/gui/controls/FieldBox.ec \
	src/gui/TableEditor.ec \
	src/EDA.ec \
	src/ers.ec \
	src/gui.ec \
	src/idList.ec \
	src/fieldValue.ec

ECSOURCES = $(call shwspace,$(_ECSOURCES))

COBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES)))))

SYMBOLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES)))))

IMPORTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES)))))

ECOBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES)))))

BOWLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES)))))

OBJECTS = $(ECOBJECTS) $(OBJ)$(MODULE).main$(O)

SOURCES = $(ECSOURCES)

RESOURCES = \
	locale/es.mo \
	locale/he.mo \
	locale/ru.mo \
	locale/zh_CN.mo

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,ecere)
endif

PRJ_CFLAGS += \
	 $(if $(WINDOWS_TARGET), \
			 -I../../deps/libffi-3.0.11/i686-pc-mingw32/include,) \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -w

ECFLAGS += -module $(MODULE)
ECFLAGS += \
	 -nolinenumbers -defaultns eda

# PLATFORM-SPECIFIC OPTIONS

ifdef WINDOWS_TARGET

endif

ifdef LINUX_TARGET
# To fix libffi build problem on Oneiric/amd64
CFLAGS += \
	 -I/usr/include/i686-linux-gnu

endif

CECFLAGS += -cpp $(_CPP)

ifndef STATIC_LIBRARY_TARGET
OFLAGS += \
	 -L../../obj/$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/bin \
	 -L../../obj/$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/lib
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(call mkdir,$(OBJ))

$(OBJ)$(MODULE).main.ec: $(SYMBOLS) $(COBJECTS)
	$(ECS) $(ARCH_FLAGS) $(ECSLIBOPT) $(SYMBOLS) $(IMPORTS) -symbols obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX) -o $(OBJ)$(MODULE).main.ec

$(OBJ)$(MODULE).main.c: $(OBJ)$(MODULE).main.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.sym -symbols $(OBJ)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.ec -o $(OBJ)$(MODULE).main.c -symbols $(OBJ)

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME) $(SONAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
	$(EAR) aw$(EARFLAGS) $(TARGET) locale/es.mo locale/he.mo locale/ru.mo locale/zh_CN.mo "locale"
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
	$(call cp,$(TARGET),../../$(SODESTDIR))
ifdef LINUX_TARGET
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../../$(SODESTDIR)$(LP)$(MODULE)$(SO).0
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../../$(SODESTDIR)$(LP)$(MODULE)$(SO)
endif

# SYMBOL RULES

$(OBJ)DirFilesDataSource.sym: src/DirFilesDataSource.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/DirFilesDataSource.ec -o $(OBJ)DirFilesDataSource.sym

$(OBJ)EDB.sym: src/EDB.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/EDB.ec -o $(OBJ)EDB.sym

$(OBJ)MemoryEDB.sym: src/MemoryEDB.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/MemoryEDB.ec -o $(OBJ)MemoryEDB.sym

$(OBJ)FieldBox.sym: src/gui/controls/FieldBox.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/controls/FieldBox.ec -o $(OBJ)FieldBox.sym

$(OBJ)TableEditor.sym: src/gui/TableEditor.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui/TableEditor.ec -o $(OBJ)TableEditor.sym

$(OBJ)EDA.sym: src/EDA.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/EDA.ec -o $(OBJ)EDA.sym

$(OBJ)ers.sym: src/ers.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/ers.ec -o $(OBJ)ers.sym

$(OBJ)gui.sym: src/gui.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/gui.ec -o $(OBJ)gui.sym

$(OBJ)idList.sym: src/idList.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/idList.ec -o $(OBJ)idList.sym

$(OBJ)fieldValue.sym: src/fieldValue.ec
	$(ECP) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) -c src/fieldValue.ec -o $(OBJ)fieldValue.sym

# C OBJECT RULES

$(OBJ)DirFilesDataSource.c: src/DirFilesDataSource.ec $(OBJ)DirFilesDataSource.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/DirFilesDataSource.ec -o $(OBJ)DirFilesDataSource.c -symbols $(OBJ)

$(OBJ)EDB.c: src/EDB.ec $(OBJ)EDB.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/EDB.ec -o $(OBJ)EDB.c -symbols $(OBJ)

$(OBJ)MemoryEDB.c: src/MemoryEDB.ec $(OBJ)MemoryEDB.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/MemoryEDB.ec -o $(OBJ)MemoryEDB.c -symbols $(OBJ)

$(OBJ)FieldBox.c: src/gui/controls/FieldBox.ec $(OBJ)FieldBox.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/controls/FieldBox.ec -o $(OBJ)FieldBox.c -symbols $(OBJ)

$(OBJ)TableEditor.c: src/gui/TableEditor.ec $(OBJ)TableEditor.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui/TableEditor.ec -o $(OBJ)TableEditor.c -symbols $(OBJ)

$(OBJ)EDA.c: src/EDA.ec $(OBJ)EDA.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/EDA.ec -o $(OBJ)EDA.c -symbols $(OBJ)

$(OBJ)ers.c: src/ers.ec $(OBJ)ers.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/ers.ec -o $(OBJ)ers.c -symbols $(OBJ)

$(OBJ)gui.c: src/gui.ec $(OBJ)gui.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/gui.ec -o $(OBJ)gui.c -symbols $(OBJ)

$(OBJ)idList.c: src/idList.ec $(OBJ)idList.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/idList.ec -o $(OBJ)idList.c -symbols $(OBJ)

$(OBJ)fieldValue.c: src/fieldValue.ec $(OBJ)fieldValue.sym | $(SYMBOLS)
	$(ECC) $(CFLAGS) $(CECFLAGS) $(ECFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c src/fieldValue.ec -o $(OBJ)fieldValue.c -symbols $(OBJ)

# OBJECT RULES

$(OBJ)DirFilesDataSource.o: $(OBJ)DirFilesDataSource.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)DirFilesDataSource.c -o $(OBJ)DirFilesDataSource.o

$(OBJ)EDB.o: $(OBJ)EDB.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)EDB.c -o $(OBJ)EDB.o

$(OBJ)MemoryEDB.o: $(OBJ)MemoryEDB.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)MemoryEDB.c -o $(OBJ)MemoryEDB.o

$(OBJ)FieldBox.o: $(OBJ)FieldBox.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)FieldBox.c -o $(OBJ)FieldBox.o

$(OBJ)TableEditor.o: $(OBJ)TableEditor.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)TableEditor.c -o $(OBJ)TableEditor.o

$(OBJ)EDA.o: $(OBJ)EDA.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)EDA.c -o $(OBJ)EDA.o

$(OBJ)ers.o: $(OBJ)ers.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)ers.c -o $(OBJ)ers.o

$(OBJ)gui.o: $(OBJ)gui.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)gui.c -o $(OBJ)gui.o

$(OBJ)idList.o: $(OBJ)idList.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)idList.c -o $(OBJ)idList.o

$(OBJ)fieldValue$(O): $(OBJ)fieldValue.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)fieldValue.c -o $(OBJ)fieldValue.o

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.c -o $(OBJ)$(MODULE).main$(O)

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
	$(call rm,$(ECOBJECTS))
	$(call rm,$(COBJECTS))
	$(call rm,$(BOWLS))
	$(call rm,$(IMPORTS))
	$(call rm,$(SYMBOLS))

realclean: cleantarget
	$(call rmr,$(OBJ))

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

Makefile: ;
$(_CF_DIR)crossplatform.mk: ;
$(_CF_DIR)default.cf: ;
