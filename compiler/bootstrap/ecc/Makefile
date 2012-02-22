.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := ecc
CONFIG := bootstrap
COMPILER := default
TARGET_TYPE = executable

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

CONSOLE = 

TARGET = obj/$(CONFIG).$(PLATFORM)/ecc$(E)

OBJECTS = \
	$(OBJ)ecc.o \
	$(OBJ)$(MODULE).main$(O)

SOURCES = \
	bootstrap/ecc.c \
	bootstrap/ecc.main.c

# CROSS-PLATFORM MAGIC

include ../../../include.mk

# FLAGS

CFLAGS = -fmessage-length=0 -O2 -ffast-math -m32 $(FPIC) -w \
	 -DECERE_STATIC

CECFLAGS =

ECFLAGS = -nolinenumbers

OFLAGS = -m32 \
	 -L../ecere/obj/bootstrap.$(PLATFORM) \
	 -L../libec/obj/bootstrap.$(PLATFORM)

LIBS = -lecereBootstrap -lecBootstrap $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

UPXFLAGS = -9 -q

# HARD CODED PLATFORM-SPECIFIC OPTIONS
ifdef LINUX
OFLAGS += -Wl,--no-undefined
endif

# PLATFORM-SPECIFIC OPTIONS

ifdef WINDOWS

LIBS += -Wl,--enable-stdcall-fixup

else
ifdef LINUX

LIBS += -lm -ldl

else
ifdef OSX

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

# OBJECT RULES

$(OBJ)ecc.o: bootstrap/ecc.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/ecc.c -o $(OBJ)ecc.o

$(OBJ)ecc.main.o: bootstrap/ecc.main.c
	$(CC) $(CFLAGS) $(FVISIBILITY) -c bootstrap/ecc.main.c -o $(OBJ)ecc.main.o

clean: objdir
	$(call rmq,$(TARGET))
	$(call rmq,$(OBJECTS))

realclean:
	$(call rmrq,$(OBJ))

distclean:
	$(call rmrq,obj/)
