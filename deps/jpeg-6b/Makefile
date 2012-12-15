.PHONY: all objdir cleantarget clean realclean distclean

# CORE VARIABLES

MODULE := libjpeg
CONFIG := release
ifndef COMPILER
COMPILER := default
endif

TARGET_TYPE = staticlib

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

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)jpeg$(A)

_OBJECTS = $(_OBJECTS1) $(_OBJECTS2)
_OBJECTS1 = \
	$(OBJ)jcapimin.o \
	$(OBJ)jcapistd.o \
	$(OBJ)jccoefct.o \
	$(OBJ)jccolor.o \
	$(OBJ)jcdctmgr.o \
	$(OBJ)jchuff.o \
	$(OBJ)jcinit.o \
	$(OBJ)jcmainct.o \
	$(OBJ)jcmarker.o \
	$(OBJ)jcmaster.o \
	$(OBJ)jcomapi.o \
	$(OBJ)jcparam.o \
	$(OBJ)jcphuff.o \
	$(OBJ)jcprepct.o \
	$(OBJ)jcsample.o \
	$(OBJ)jctrans.o \
	$(OBJ)jdapimin.o \
	$(OBJ)jdapistd.o \
	$(OBJ)jdatadst.o \
	$(OBJ)jdatasrc.o \
	$(OBJ)jdcoefct.o \
	$(OBJ)jdcolor.o \
	$(OBJ)jddctmgr.o \
	$(OBJ)jdhuff.o \
	$(OBJ)jdinput.o \
	$(OBJ)jdmainct.o \
	$(OBJ)jdmarker.o \
	$(OBJ)jdmaster.o \
	$(OBJ)jdmerge.o \
	$(OBJ)jdphuff.o \
	$(OBJ)jdpostct.o
_OBJECTS2 = \
	$(OBJ)jdsample.o \
	$(OBJ)jdtrans.o \
	$(OBJ)jerror.o \
	$(OBJ)jfdctflt.o \
	$(OBJ)jfdctfst.o \
	$(OBJ)jfdctint.o \
	$(OBJ)jidctflt.o \
	$(OBJ)jidctfst.o \
	$(OBJ)jidctint.o \
	$(OBJ)jidctred.o \
	$(OBJ)jmemansi.o \
	$(OBJ)jmemmgr.o \
	$(OBJ)jmemname.o \
	$(OBJ)jmemnobs.o \
	$(OBJ)jquant1.o \
	$(OBJ)jquant2.o \
	$(OBJ)jutils.o \
	$(OBJ)transupp.o

OBJECTS = $(_OBJECTS)

SOURCES = \
	jcapimin.c \
	jcapistd.c \
	jccoefct.c \
	jccolor.c \
	jcdctmgr.c \
	jchuff.c \
	jcinit.c \
	jcmainct.c \
	jcmarker.c \
	jcmaster.c \
	jcomapi.c \
	jcparam.c \
	jcphuff.c \
	jcprepct.c \
	jcsample.c \
	jctrans.c \
	jdapimin.c \
	jdapistd.c \
	jdatadst.c \
	jdatasrc.c \
	jdcoefct.c \
	jdcolor.c \
	jddctmgr.c \
	jdhuff.c \
	jdinput.c \
	jdmainct.c \
	jdmarker.c \
	jdmaster.c \
	jdmerge.c \
	jdphuff.c \
	jdpostct.c \
	jdsample.c \
	jdtrans.c \
	jerror.c \
	jfdctflt.c \
	jfdctfst.c \
	jfdctint.c \
	jidctflt.c \
	jidctfst.c \
	jidctint.c \
	jidctred.c \
	jmemansi.c \
	jmemmgr.c \
	jmemname.c \
	jmemnobs.c \
	jquant1.c \
	jquant2.c \
	jutils.c \
	transupp.c

RESOURCES =

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -w $(FORCE_32_BIT)





CECFLAGS += -cpp $(_CPP)

ifndef STATIC_LIBRARY_TARGET
OFLAGS +=
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

$(OBJ)jcapimin.o: jcapimin.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jcapimin.c -o $(OBJ)jcapimin.o

$(OBJ)jcapistd.o: jcapistd.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jcapistd.c -o $(OBJ)jcapistd.o

$(OBJ)jccoefct.o: jccoefct.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jccoefct.c -o $(OBJ)jccoefct.o

$(OBJ)jccolor.o: jccolor.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jccolor.c -o $(OBJ)jccolor.o

$(OBJ)jcdctmgr.o: jcdctmgr.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jcdctmgr.c -o $(OBJ)jcdctmgr.o

$(OBJ)jchuff.o: jchuff.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jchuff.c -o $(OBJ)jchuff.o

$(OBJ)jcinit.o: jcinit.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jcinit.c -o $(OBJ)jcinit.o

$(OBJ)jcmainct.o: jcmainct.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jcmainct.c -o $(OBJ)jcmainct.o

$(OBJ)jcmarker.o: jcmarker.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jcmarker.c -o $(OBJ)jcmarker.o

$(OBJ)jcmaster.o: jcmaster.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jcmaster.c -o $(OBJ)jcmaster.o

$(OBJ)jcomapi.o: jcomapi.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jcomapi.c -o $(OBJ)jcomapi.o

$(OBJ)jcparam.o: jcparam.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jcparam.c -o $(OBJ)jcparam.o

$(OBJ)jcphuff.o: jcphuff.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jcphuff.c -o $(OBJ)jcphuff.o

$(OBJ)jcprepct.o: jcprepct.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jcprepct.c -o $(OBJ)jcprepct.o

$(OBJ)jcsample.o: jcsample.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jcsample.c -o $(OBJ)jcsample.o

$(OBJ)jctrans.o: jctrans.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jctrans.c -o $(OBJ)jctrans.o

$(OBJ)jdapimin.o: jdapimin.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jdapimin.c -o $(OBJ)jdapimin.o

$(OBJ)jdapistd.o: jdapistd.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jdapistd.c -o $(OBJ)jdapistd.o

$(OBJ)jdatadst.o: jdatadst.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jdatadst.c -o $(OBJ)jdatadst.o

$(OBJ)jdatasrc.o: jdatasrc.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jdatasrc.c -o $(OBJ)jdatasrc.o

$(OBJ)jdcoefct.o: jdcoefct.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jdcoefct.c -o $(OBJ)jdcoefct.o

$(OBJ)jdcolor.o: jdcolor.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jdcolor.c -o $(OBJ)jdcolor.o

$(OBJ)jddctmgr.o: jddctmgr.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jddctmgr.c -o $(OBJ)jddctmgr.o

$(OBJ)jdhuff.o: jdhuff.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jdhuff.c -o $(OBJ)jdhuff.o

$(OBJ)jdinput.o: jdinput.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jdinput.c -o $(OBJ)jdinput.o

$(OBJ)jdmainct.o: jdmainct.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jdmainct.c -o $(OBJ)jdmainct.o

$(OBJ)jdmarker.o: jdmarker.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jdmarker.c -o $(OBJ)jdmarker.o

$(OBJ)jdmaster.o: jdmaster.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jdmaster.c -o $(OBJ)jdmaster.o

$(OBJ)jdmerge.o: jdmerge.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jdmerge.c -o $(OBJ)jdmerge.o

$(OBJ)jdphuff.o: jdphuff.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jdphuff.c -o $(OBJ)jdphuff.o

$(OBJ)jdpostct.o: jdpostct.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jdpostct.c -o $(OBJ)jdpostct.o

$(OBJ)jdsample.o: jdsample.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jdsample.c -o $(OBJ)jdsample.o

$(OBJ)jdtrans.o: jdtrans.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jdtrans.c -o $(OBJ)jdtrans.o

$(OBJ)jerror.o: jerror.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jerror.c -o $(OBJ)jerror.o

$(OBJ)jfdctflt.o: jfdctflt.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jfdctflt.c -o $(OBJ)jfdctflt.o

$(OBJ)jfdctfst.o: jfdctfst.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jfdctfst.c -o $(OBJ)jfdctfst.o

$(OBJ)jfdctint.o: jfdctint.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jfdctint.c -o $(OBJ)jfdctint.o

$(OBJ)jidctflt.o: jidctflt.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jidctflt.c -o $(OBJ)jidctflt.o

$(OBJ)jidctfst.o: jidctfst.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jidctfst.c -o $(OBJ)jidctfst.o

$(OBJ)jidctint.o: jidctint.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jidctint.c -o $(OBJ)jidctint.o

$(OBJ)jidctred.o: jidctred.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jidctred.c -o $(OBJ)jidctred.o

$(OBJ)jmemansi.o: jmemansi.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jmemansi.c -o $(OBJ)jmemansi.o

$(OBJ)jmemmgr.o: jmemmgr.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jmemmgr.c -o $(OBJ)jmemmgr.o

$(OBJ)jmemname.o: jmemname.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jmemname.c -o $(OBJ)jmemname.o

$(OBJ)jmemnobs.o: jmemnobs.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jmemnobs.c -o $(OBJ)jmemnobs.o

$(OBJ)jquant1.o: jquant1.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jquant1.c -o $(OBJ)jquant1.o

$(OBJ)jquant2.o: jquant2.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jquant2.c -o $(OBJ)jquant2.o

$(OBJ)jutils.o: jutils.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c jutils.c -o $(OBJ)jutils.o

$(OBJ)transupp.o: transupp.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c transupp.c -o $(OBJ)transupp.o

cleantarget: objdir
	$(call rmq,$(TARGET))

clean: cleantarget
	$(call rmq,$(_OBJECTS1))
	$(call rmq,$(_OBJECTS2))

realclean: cleantarget
	$(call rmrq,$(OBJ))

distclean: cleantarget
	$(call rmrq,obj/)
