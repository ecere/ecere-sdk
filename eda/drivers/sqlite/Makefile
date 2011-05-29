.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := EDASQLite
CONFIG := release
COMPILER := default
TARGET_TYPE = sharedlib

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

# CROSS-PLATFORM MAGIC

include ../../../include.mk

ifdef LINUX
TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)EDASQLite$(SO).0.44
SONAME = -Wl,-soname,$(LP)EDASQLite$(SO).0
else
TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)EDASQLite$(SO)
SONAME =
endif

OBJECTS = $(OBJ)sqlite3.o $(OBJ)EDASQLite.o $(OBJ)EDASQLiteCommon.o \
	$(OBJ)$(MODULE).main$(O)

COBJECTS = $(OBJ)EDASQLite.c $(OBJ)EDASQLiteCommon.c

SYMBOLS = $(OBJ)EDASQLite.sym $(OBJ)EDASQLiteCommon.sym

IMPORTS = $(OBJ)EDASQLite.imp $(OBJ)EDASQLiteCommon.imp

SOURCES = sqlite3.c EDASQLite.ec EDASQLiteCommon.ec

RESOURCES =

# TOOLCHAIN
export LD_LIBRARY_PATH = ../../../obj/$(PLATFORM)/lib/
export DYLD_LIBRARY_PATH = ../../../obj/$(PLATFORM)/lib/
CPP := cpp
CC := gcc
ECP := $(call psep,../../../obj/$(PLATFORM)/bin/ecp)
ECC := $(call psep,../../../obj/$(PLATFORM)/bin/ecc)
ECS := $(call psep,../../../obj/$(PLATFORM)/bin/ecs)
EAR := $(call psep,../../../obj/$(PLATFORM)/bin/ear)
LD := gcc
AR := ar
STRIP := strip
UPX := upx

# FLAGS

CFLAGS = -fmessage-length=0 -O2 -m32 $(FPIC) -w

CECFLAGS =

ECFLAGS = -nolinenumbers

OFLAGS = -m32 \
	 -L../../../obj/$(PLATFORM)/bin \
	 -L../../../obj/$(PLATFORM)/lib

LIBS = -lecere $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

UPXFLAGS = -9 -q

# HARD CODED PLATFORM-SPECIFIC OPTIONS
ifdef LINUX
OFLAGS += -Wl,--no-undefined
endif

# PLATFORM-SPECIFIC OPTIONS

ifdef LINUX

LIBS += -lpthread -ldl

else
ifdef OSX

LIBS += -lpthread -ldl

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

$(TARGET): $(SOURCES) $(RESOURCES) | objdir $(SYMBOLS) $(OBJECTS)
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME) $(SONAME)
	$(STRIP) $(STRIPOPT) $(TARGET)
	$(call cpq,$(TARGET),../../../$(SODESTDIR))
ifdef LINUX
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../../../$(SODESTDIR)$(LP)$(MODULE)$(SO).0
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../../../$(SODESTDIR)$(LP)$(MODULE)$(SO)
endif	

# SYMBOL RULES

$(OBJ)EDASQLite.sym: EDASQLite.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c EDASQLite.ec -o $(OBJ)EDASQLite.sym

$(OBJ)EDASQLiteCommon.sym: EDASQLiteCommon.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c EDASQLiteCommon.ec -o $(OBJ)EDASQLiteCommon.sym

# C OBJECT RULES

$(OBJ)EDASQLite.c: EDASQLite.ec $(OBJ)EDASQLite.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c EDASQLite.ec -o $(OBJ)EDASQLite.c -symbols $(OBJ)

$(OBJ)EDASQLiteCommon.c: EDASQLiteCommon.ec $(OBJ)EDASQLiteCommon.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c EDASQLiteCommon.ec -o $(OBJ)EDASQLiteCommon.c -symbols $(OBJ)

# IMPLICIT OBJECT RULE

$(OBJ)%$(O) : $(OBJ)%.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c $< -o $@

# OBJECT RULES

$(OBJ)sqlite3.o: sqlite3.c
	$(CC) $(CFLAGS) -c sqlite3.c -o $(OBJ)sqlite3.o

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
