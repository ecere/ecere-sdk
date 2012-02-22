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

OBJECTS = \
	$(OBJ)sqlite3.o \
	$(OBJ)EDASQLite.o \
	$(OBJ)$(MODULE).main$(O)

COBJECTS = \
	$(OBJ)EDASQLite.c

SYMBOLS = \
	$(OBJ)EDASQLite.sym

IMPORTS = \
	$(OBJ)EDASQLite.imp

SOURCES = \
	sqlite3.c \
	EDASQLite.ec

RESOURCES = \
	locale/zh_CN/LC_MESSAGES/EDASQLite.mo \
	locale/es_ES/LC_MESSAGES/EDASQLite.mo


# TOOLCHAIN
export LD_LIBRARY_PATH = ../../../obj/$(PLATFORM)/lib/
export DYLD_LIBRARY_PATH = ../../../obj/$(PLATFORM)/lib/
ECP := $(call psep,../../../obj/$(PLATFORM)/bin/ecp)
ECC := $(call psep,../../../obj/$(PLATFORM)/bin/ecc)
ECS := $(call psep,../../../obj/$(PLATFORM)/bin/ecs)
EAR := $(call psep,../../../obj/$(PLATFORM)/bin/ear)

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

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME) $(SONAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
	$(EAR) awq $(TARGET) locale/zh_CN/LC_MESSAGES/EDASQLite.mo "locale/zh_CN/LC_MESSAGES"
	$(EAR) awq $(TARGET) locale/es_ES/LC_MESSAGES/EDASQLite.mo "locale/es_ES/LC_MESSAGES"
	$(call cpq,$(TARGET),../../../$(SODESTDIR))
ifdef LINUX
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../../../$(SODESTDIR)$(LP)$(MODULE)$(SO).0
	ln -sf $(LP)$(MODULE)$(SO).0.44 ../../../$(SODESTDIR)$(LP)$(MODULE)$(SO)
endif	

# SYMBOL RULES

$(OBJ)EDASQLite.sym: EDASQLite.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c EDASQLite.ec -o $(OBJ)EDASQLite.sym

# C OBJECT RULES

$(OBJ)EDASQLite.c: EDASQLite.ec $(OBJ)EDASQLite.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c EDASQLite.ec -o $(OBJ)EDASQLite.c -symbols $(OBJ)

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
