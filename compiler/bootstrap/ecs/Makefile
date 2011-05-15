.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := ecs
CONFIG := bootstrap
COMPILER := default
TARGET_TYPE = executable

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

CONSOLE = 

TARGET = obj/$(CONFIG).$(PLATFORM)/ecs$(E)

OBJECTS = $(OBJ)ecs.o $(OBJ)$(MODULE).main$(O)

SOURCES = bootstrap/ecs.c bootstrap/ecs.main.c

# CROSS-PLATFORM MAGIC

include ../../../include.mk

# TOOLCHAIN

CPP := cpp
CC := gcc
ECP := ecp
ECC := ecc
ECS := ecs
EAR := ear
LD := gcc
AR := ar
STRIP := strip
UPX := upx

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

LIBS += 

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
	$(STRIP) $(STRIPOPT) $(TARGET)

$(OBJ)ecs.o: bootstrap/ecs.c
	$(CC) $(CFLAGS) -c bootstrap/ecs.c -o $(OBJ)ecs.o

$(OBJ)ecs.main.o: bootstrap/ecs.main.c
	$(CC) $(CFLAGS) -c bootstrap/ecs.main.c -o $(OBJ)ecs.main.o

clean: objdir
	$(call rmq,$(TARGET))
	$(call rmq,$(OBJECTS))

realclean:
	$(call rmrq,$(OBJ))

distclean:
	$(call rmrq,obj/)
