.PHONY: all objdir clean realclean distclean

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
endif
CECFLAGS =
OFLAGS =
LDFLAGS =
LIBS =

ifdef DEBUG
NOSTRIP := y
endif

CONSOLE = -mwindows

# INCLUDES

_CF_DIR = ../../

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)include.mk

# CUSTOM TOOLCHAIN / COMPILER CONFIG

export LD_LIBRARY_PATH = ../../obj/$(PLATFORM)/lib/
export DYLD_LIBRARY_PATH = ../../obj/$(PLATFORM)/lib/
ECP := $(call psep,../../obj/$(PLATFORM)/bin/ecp)
ECC := $(call psep,../../obj/$(PLATFORM)/bin/ecc)
ECS := $(call psep,../../obj/$(PLATFORM)/bin/ecs)
EAR := $(call psep,../../obj/$(PLATFORM)/bin/ear)

# END OF CUSTOM TOOLCHAIN / COMPILER CONFIG

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

ifdef LINUX_TARGET
TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)EDA$(SO).0.44
SONAME = -Wl,-soname,$(LP)EDA$(SO).0
else
TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)EDA$(SO)
SONAME =
endif

_ECSOURCES = \
	src/EDB.ec \
	src/MemoryEDB.ec \
	src/gui/controls/FieldBox.ec \
	src/gui/TableEditor.ec \
	src/EDA.ec \
	src/ers.ec \
	src/gui.ec \
	src/idList.ec

ECSOURCES = $(call shwspace,$(_ECSOURCES))

COBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(C),$(notdir $(_ECSOURCES)))))

SYMBOLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(S),$(notdir $(_ECSOURCES)))))

IMPORTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(I),$(notdir $(_ECSOURCES)))))

ECOBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(O),$(notdir $(_ECSOURCES)))))

BOWLS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.ec,%$(B),$(notdir $(_ECSOURCES)))))

OBJECTS = $(ECOBJECTS) $(OBJ)$(MODULE).main$(O)

SOURCES = $(ECSOURCES)

RESOURCES = \
	locale/zh_CN/LC_MESSAGES/EDA.mo \
	locale/es_ES/LC_MESSAGES/EDA.mo

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

ifndef STATIC_LIBRARY_TARGET
LIBS += \
	$(call _L,ecere)
endif

CFLAGS += \
	 $(if $(DEBIAN_PACKAGE),$(CPPFLAGS),) $(if $(DEBUG), -D_DEBUG,) \
	 $(if $(WINDOWS_TARGET), \
			 -I../../deps/libffi-3.0.11/i686-pc-mingw32/include,) \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FORCE_32_BIT) $(FPIC) -w


ECFLAGS += \
	 -nolinenumbers -defaultns eda


# PLATFORM-SPECIFIC OPTIONS

ifdef WINDOWS_TARGET

endif



CECFLAGS += -cpp $(_CPP)

ifndef STATIC_LIBRARY_TARGET
OFLAGS += $(FORCE_32_BIT) \
	 -L../../obj/$(PLATFORM)/bin \
	 -L../../obj/$(PLATFORM)/lib
OFLAGS += $(LDFLAGS)
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
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME) $(SONAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
	$(EAR) $(EARFLAGS) $(TARGET) locale/zh_CN/LC_MESSAGES/EDA.mo "locale/zh_CN/LC_MESSAGES"
	$(EAR) $(EARFLAGS) $(TARGET) locale/es_ES/LC_MESSAGES/EDA.mo "locale/es_ES/LC_MESSAGES"
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
	$(call cpq,$(TARGET),../../$(SODESTDIR))
ifdef LINUX_TARGET
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../../$(SODESTDIR)$(LP)$(MODULE)$(SO).0
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../../$(SODESTDIR)$(LP)$(MODULE)$(SO)
endif

# SYMBOL RULES

$(OBJ)EDB.sym: src/EDB.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/EDB.ec -o $(OBJ)EDB.sym

$(OBJ)MemoryEDB.sym: src/MemoryEDB.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/MemoryEDB.ec -o $(OBJ)MemoryEDB.sym

$(OBJ)FieldBox.sym: src/gui/controls/FieldBox.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/controls/FieldBox.ec -o $(OBJ)FieldBox.sym

$(OBJ)TableEditor.sym: src/gui/TableEditor.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui/TableEditor.ec -o $(OBJ)TableEditor.sym

$(OBJ)EDA.sym: src/EDA.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/EDA.ec -o $(OBJ)EDA.sym

$(OBJ)ers.sym: src/ers.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/ers.ec -o $(OBJ)ers.sym

$(OBJ)gui.sym: src/gui.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/gui.ec -o $(OBJ)gui.sym

$(OBJ)idList.sym: src/idList.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c src/idList.ec -o $(OBJ)idList.sym

# C OBJECT RULES

$(OBJ)EDB.c: src/EDB.ec $(OBJ)EDB.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/EDB.ec -o $(OBJ)EDB.c -symbols $(OBJ)

$(OBJ)MemoryEDB.c: src/MemoryEDB.ec $(OBJ)MemoryEDB.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/MemoryEDB.ec -o $(OBJ)MemoryEDB.c -symbols $(OBJ)

$(OBJ)FieldBox.c: src/gui/controls/FieldBox.ec $(OBJ)FieldBox.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/controls/FieldBox.ec -o $(OBJ)FieldBox.c -symbols $(OBJ)

$(OBJ)TableEditor.c: src/gui/TableEditor.ec $(OBJ)TableEditor.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui/TableEditor.ec -o $(OBJ)TableEditor.c -symbols $(OBJ)

$(OBJ)EDA.c: src/EDA.ec $(OBJ)EDA.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/EDA.ec -o $(OBJ)EDA.c -symbols $(OBJ)

$(OBJ)ers.c: src/ers.ec $(OBJ)ers.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/ers.ec -o $(OBJ)ers.c -symbols $(OBJ)

$(OBJ)gui.c: src/gui.ec $(OBJ)gui.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/gui.ec -o $(OBJ)gui.c -symbols $(OBJ)

$(OBJ)idList.c: src/idList.ec $(OBJ)idList.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c src/idList.ec -o $(OBJ)idList.c -symbols $(OBJ)

# OBJECT RULES

$(OBJ)EDB.o: $(OBJ)EDB.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)EDB.c -o $(OBJ)EDB.o

$(OBJ)MemoryEDB.o: $(OBJ)MemoryEDB.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)MemoryEDB.c -o $(OBJ)MemoryEDB.o

$(OBJ)FieldBox.o: $(OBJ)FieldBox.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)FieldBox.c -o $(OBJ)FieldBox.o

$(OBJ)TableEditor.o: $(OBJ)TableEditor.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)TableEditor.c -o $(OBJ)TableEditor.o

$(OBJ)EDA.o: $(OBJ)EDA.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)EDA.c -o $(OBJ)EDA.o

$(OBJ)ers.o: $(OBJ)ers.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)ers.c -o $(OBJ)ers.o

$(OBJ)gui.o: $(OBJ)gui.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)gui.c -o $(OBJ)gui.o

$(OBJ)idList.o: $(OBJ)idList.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)idList.c -o $(OBJ)idList.o

$(OBJ)$(MODULE).main$(O): $(OBJ)$(MODULE).main.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $(OBJ)$(MODULE).main.c -o $(OBJ)$(MODULE).main$(O)

clean: objdir
	$(call rmq,$(OBJ)$(MODULE).main.o $(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S) $(TARGET))
	$(call rmq,$(_OBJECTS))
	$(call rmq,$(ECOBJECTS))
	$(call rmq,$(COBJECTS))
	$(call rmq,$(BOWLS))
	$(call rmq,$(IMPORTS))
	$(call rmq,$(SYMBOLS))

realclean: clean
	$(call rmrq,$(OBJ))

distclean:
	$(call rmrq,obj/)
