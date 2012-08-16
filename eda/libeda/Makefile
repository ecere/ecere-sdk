.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := EDA
CONFIG := release
COMPILER := default
TARGET_TYPE = sharedlib

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

ifndef DEBIAN_PACKAGE
CFLAGS =
endif
OFLAGS =

# CROSS-PLATFORM MAGIC

include ../../include.mk

ifdef LINUX
TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)EDA$(SO).0.44
SONAME = -Wl,-soname,$(LP)EDA$(SO).0
else
TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)EDA$(SO)
SONAME =
endif

OBJECTS = \
	$(OBJ)EDB.o \
	$(OBJ)MemoryEDB.o \
	$(OBJ)FieldBox.o \
	$(OBJ)TableEditor.o \
	$(OBJ)EDA.o \
	$(OBJ)ers.o \
	$(OBJ)gui.o \
	$(OBJ)idList.o \
	$(OBJ)$(MODULE).main$(O)

COBJECTS = \
	$(OBJ)EDB.c \
	$(OBJ)MemoryEDB.c \
	$(OBJ)FieldBox.c \
	$(OBJ)TableEditor.c \
	$(OBJ)EDA.c \
	$(OBJ)ers.c \
	$(OBJ)gui.c \
	$(OBJ)idList.c

SYMBOLS = \
	$(OBJ)EDB.sym \
	$(OBJ)MemoryEDB.sym \
	$(OBJ)FieldBox.sym \
	$(OBJ)TableEditor.sym \
	$(OBJ)EDA.sym \
	$(OBJ)ers.sym \
	$(OBJ)gui.sym \
	$(OBJ)idList.sym

IMPORTS = \
	$(OBJ)EDB.imp \
	$(OBJ)MemoryEDB.imp \
	$(OBJ)FieldBox.imp \
	$(OBJ)TableEditor.imp \
	$(OBJ)EDA.imp \
	$(OBJ)ers.imp \
	$(OBJ)gui.imp \
	$(OBJ)idList.imp

SOURCES = \
	src/EDB.ec \
	src/MemoryEDB.ec \
	src/gui/controls/FieldBox.ec \
	src/gui/TableEditor.ec \
	src/EDA.ec \
	src/ers.ec \
	src/gui.ec \
	src/idList.ec

RESOURCES = \
	locale/zh_CN/LC_MESSAGES/EDA.mo \
	locale/es_ES/LC_MESSAGES/EDA.mo

# TOOLCHAIN
export LD_LIBRARY_PATH = ../../obj/$(PLATFORM)/lib/
export DYLD_LIBRARY_PATH = ../../obj/$(PLATFORM)/lib/
ECP := $(call psep,../../obj/$(PLATFORM)/bin/ecp)
ECC := $(call psep,../../obj/$(PLATFORM)/bin/ecc)
ECS := $(call psep,../../obj/$(PLATFORM)/bin/ecs)
EAR := $(call psep,../../obj/$(PLATFORM)/bin/ear)

# FLAGS

CFLAGS += -fmessage-length=0 -O2 -ffast-math -m32 $(FPIC) -w

CECFLAGS =

ECFLAGS = -nolinenumbers -defaultns eda

OFLAGS += -m32 \
	 -L../../obj/$(PLATFORM)/bin \
	 -L../../obj/$(PLATFORM)/lib

LIBS = -lecere $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

UPXFLAGS = -9 -q

# HARD CODED PLATFORM-SPECIFIC OPTIONS
ifdef LINUX
OFLAGS += -Wl,--no-undefined
endif

# PLATFORM-SPECIFIC OPTIONS

ifdef WINDOWS

CFLAGS += \
	 -I../../deps/libffi-3.0.11/i686-pc-mingw32/include

endif

ifdef LINUX

CFLAGS += \
	 -I/usr/include/i686-linux-gnu

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
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME) $(SONAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
	$(EAR) awq $(TARGET) locale/zh_CN/LC_MESSAGES/EDA.mo "locale/zh_CN/LC_MESSAGES"
	$(EAR) awq $(TARGET) locale/es_ES/LC_MESSAGES/EDA.mo "locale/es_ES/LC_MESSAGES"
	$(call cpq,$(TARGET),../../$(SODESTDIR))
ifdef LINUX
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
	$(call rmq,$(OBJ)$(MODULE).main.c $(OBJ)$(MODULE).main.ec $(OBJ)$(MODULE).main$(I) $(OBJ)$(MODULE).main$(S) $(TARGET))
	$(call rmq,$(OBJECTS))
	$(call rmq,$(COBJECTS))
	$(call rmq,$(IMPORTS))
	$(call rmq,$(SYMBOLS))

realclean:
	$(call rmrq,$(OBJ))

distclean:
	$(call rmrq,obj/)
