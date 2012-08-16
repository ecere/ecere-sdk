.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := libpng
CONFIG := release
COMPILER := default
TARGET_TYPE = staticlib

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)png$(A)

OBJECTS = \
	$(OBJ)png.o \
	$(OBJ)pngerror.o \
	$(OBJ)pngget.o \
	$(OBJ)pngmem.o \
	$(OBJ)pngpread.o \
	$(OBJ)pngread.o \
	$(OBJ)pngrio.o \
	$(OBJ)pngrtran.o \
	$(OBJ)pngrutil.o \
	$(OBJ)pngset.o \
	$(OBJ)pngtrans.o \
	$(OBJ)pngwio.o \
	$(OBJ)pngwrite.o \
	$(OBJ)pngwtran.o \
	$(OBJ)pngwutil.o

COBJECTS =

SYMBOLS =

IMPORTS =

SOURCES = \
	./png.c \
	./pngerror.c \
	./pngget.c \
	./pngmem.c \
	./pngpread.c \
	./pngread.c \
	./pngrio.c \
	./pngrtran.c \
	./pngrutil.c \
	./pngset.c \
	./pngtrans.c \
	./pngwio.c \
	./pngwrite.c \
	./pngwtran.c \
	./pngwutil.c

RESOURCES =

ifndef DEBIAN_PACKAGE
CFLAGS =
endif
OFLAGS =

# CROSS-PLATFORM MAGIC

include ../../include.mk

# FLAGS

CFLAGS += -fmessage-length=0 -O2 -ffast-math -m32 $(FPIC) -w \
	 -I. \
	 -I../zlib

LIBS = $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

UPXFLAGS = -9 -q

# HARD CODED PLATFORM-SPECIFIC OPTIONS
ifdef LINUX
OFLAGS += -Wl,--no-undefined
endif

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdirq,$(OBJ)))

$(TARGET): $(SOURCES) $(RESOURCES) | objdir $(SYMBOLS) $(OBJECTS)
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)

# SYMBOL RULES

# C OBJECT RULES

# OBJECT RULES

$(OBJ)png.o: ./png.c
	$(CC) $(CFLAGS) -c ./png.c -o $(OBJ)png.o

$(OBJ)pngerror.o: ./pngerror.c
	$(CC) $(CFLAGS) -c ./pngerror.c -o $(OBJ)pngerror.o

$(OBJ)pngget.o: ./pngget.c
	$(CC) $(CFLAGS) -c ./pngget.c -o $(OBJ)pngget.o

$(OBJ)pngmem.o: ./pngmem.c
	$(CC) $(CFLAGS) -c ./pngmem.c -o $(OBJ)pngmem.o

$(OBJ)pngpread.o: ./pngpread.c
	$(CC) $(CFLAGS) -c ./pngpread.c -o $(OBJ)pngpread.o

$(OBJ)pngread.o: ./pngread.c
	$(CC) $(CFLAGS) -c ./pngread.c -o $(OBJ)pngread.o

$(OBJ)pngrio.o: ./pngrio.c
	$(CC) $(CFLAGS) -c ./pngrio.c -o $(OBJ)pngrio.o

$(OBJ)pngrtran.o: ./pngrtran.c
	$(CC) $(CFLAGS) -c ./pngrtran.c -o $(OBJ)pngrtran.o

$(OBJ)pngrutil.o: ./pngrutil.c
	$(CC) $(CFLAGS) -c ./pngrutil.c -o $(OBJ)pngrutil.o

$(OBJ)pngset.o: ./pngset.c
	$(CC) $(CFLAGS) -c ./pngset.c -o $(OBJ)pngset.o

$(OBJ)pngtrans.o: ./pngtrans.c
	$(CC) $(CFLAGS) -c ./pngtrans.c -o $(OBJ)pngtrans.o

$(OBJ)pngwio.o: ./pngwio.c
	$(CC) $(CFLAGS) -c ./pngwio.c -o $(OBJ)pngwio.o

$(OBJ)pngwrite.o: ./pngwrite.c
	$(CC) $(CFLAGS) -c ./pngwrite.c -o $(OBJ)pngwrite.o

$(OBJ)pngwtran.o: ./pngwtran.c
	$(CC) $(CFLAGS) -c ./pngwtran.c -o $(OBJ)pngwtran.o

$(OBJ)pngwutil.o: ./pngwutil.c
	$(CC) $(CFLAGS) -c ./pngwutil.c -o $(OBJ)pngwutil.o

clean: objdir
	$(call rmq,$(TARGET))
	$(call rmq,$(OBJECTS))
	$(call rmq,$(COBJECTS))

realclean:
	$(call rmrq,$(OBJ))

distclean:
	$(call rmrq,obj/)
