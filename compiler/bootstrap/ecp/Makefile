.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := ecp
CONFIG := bootstrap
COMPILER := default
TARGET_TYPE = executable

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

CONSOLE = 

TARGET = obj/$(CONFIG).$(PLATFORM)/ecp$(E)

OBJECTS = \
	$(OBJ)ecp.o \
	$(OBJ)$(MODULE).main$(O)

SOURCES = \
	bootstrap/ecp.c \
	bootstrap/ecp.main.c

ifndef DEBIAN_PACKAGE
CFLAGS =
endif
OFLAGS =

# CROSS-PLATFORM MAGIC

include ../../../crossplatform.mk
include ../../../include.mk

# FLAGS

CFLAGS += -fmessage-length=0 -O2 -ffast-math $(FORCE_32_BIT) $(FPIC) -w \
	 -DECERE_STATIC

CECFLAGS =

ECFLAGS = -nolinenumbers

OFLAGS += $(FORCE_32_BIT) \
	 -L../ecere/obj/bootstrap.$(PLATFORM) \
	 -L../libec/obj/bootstrap.$(PLATFORM)

LIBS = -lecereBootstrap -lecBootstrap $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

UPXFLAGS = -9 -q

# HARD CODED PLATFORM-SPECIFIC OPTIONS
ifdef LINUX_TARGET
OFLAGS += -Wl,--no-undefined
endif

# PLATFORM-SPECIFIC OPTIONS

ifdef WINDOWS_TARGET

else
ifdef LINUX_TARGET

LIBS += -lm -ldl

else
ifdef OSX_TARGET

LIBS += -lm -ldl

endif
endif
endif
# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))

$(TARGET): $(SOURCES) $(RESOURCES) | objdir $(SYMBOLS) $(OBJECTS)
	$(CC) $(OFLAGS) $(OBJECTS) $(LIBS) -o $(TARGET) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif

$(OBJ)ecp.o: bootstrap/ecp.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/ecp.c -o $(OBJ)ecp.o

$(OBJ)ecp.main.o: bootstrap/ecp.main.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/ecp.main.c -o $(OBJ)ecp.main.o

clean: objdir
	$(call rmq,$(TARGET))
	$(call rmq,$(OBJECTS))

realclean:
	$(call rmrq,$(OBJ))

distclean:
	$(call rmrq,obj/)
