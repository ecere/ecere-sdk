.PHONY: all objdir cleantarget clean realclean distclean

# CORE VARIABLES

MODULE := libjpeg
VERSION := 
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

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)jpeg$(A)

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
	$(OBJ)jdpostct.o \
	$(OBJ)jdsample.o \
	$(OBJ)jdtrans.o
_OBJECTS2 = \
	$(OBJ)jerror.o \
	$(OBJ)jfdctflt.o \
	$(OBJ)jfdctfst.o \
	$(OBJ)jfdctint.o \
	$(OBJ)jidctflt.o \
	$(OBJ)jidctfst.o \
	$(OBJ)jidctint.o \
	$(OBJ)jquant1.o \
	$(OBJ)jquant2.o \
	$(OBJ)jutils.o \
	$(OBJ)jaricom.o \
	$(OBJ)jcarith.o \
	$(OBJ)jdarith.o \
	$(OBJ)jmemmgr.o \
	$(OBJ)jmemnobs.o \
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
	jquant1.c \
	jquant2.c \
	jutils.c \
	jaricom.c \
	jcarith.c \
	jdarith.c \
	jmemmgr.c \
	jmemnobs.c \
	transupp.c

RESOURCES =

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -w -DREPOSITORY_VERSION="\"$(REPOSITORY_VER)\""

ECFLAGS += -module $(MODULE)
CECFLAGS += -cpp $(_CPP)

# TARGETS

all: objdir $(TARGET)

objdir:
	$(call mkdir,$(OBJ))

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES) $(SYMBOLS) $(OBJECTS) | objdir
	@$(call rm,$(OBJ)objects.lst)
	@$(call touch,$(OBJ)objects.lst)
	$(call addtolistfile,$(_OBJECTS1),$(OBJ)objects.lst)
	$(call addtolistfile,$(_OBJECTS2),$(OBJ)objects.lst)
ifndef STATIC_LIBRARY_TARGET
	$(CC) $(OFLAGS) @$(OBJ)objects.lst $(LIBS) -o $(TARGET) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
else
ifdef WINDOWS_HOST
	$(AR) rcs $(TARGET) @$(OBJ)objects.lst $(LIBS)
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
endif
ifdef SHARED_LIBRARY_TARGET
ifdef LINUX_TARGET
ifdef LINUX_HOST
	$(if $(basename $(VER)),ln -sf $(LP)$(MODULE)$(SO)$(VER) $(OBJ)$(LP)$(MODULE)$(SO)$(basename $(VER)),)
	$(if $(VER),ln -sf $(LP)$(MODULE)$(SO)$(VER) $(OBJ)$(LP)$(MODULE)$(SO),)
endif
endif
endif

# SYMBOL RULES

# C OBJECT RULES

# OBJECT RULES

$(OBJ)jcapimin.o: jcapimin.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jcapimin.c) -o $(call quote_path,$@)

$(OBJ)jcapistd.o: jcapistd.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jcapistd.c) -o $(call quote_path,$@)

$(OBJ)jccoefct.o: jccoefct.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jccoefct.c) -o $(call quote_path,$@)

$(OBJ)jccolor.o: jccolor.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jccolor.c) -o $(call quote_path,$@)

$(OBJ)jcdctmgr.o: jcdctmgr.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jcdctmgr.c) -o $(call quote_path,$@)

$(OBJ)jchuff.o: jchuff.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jchuff.c) -o $(call quote_path,$@)

$(OBJ)jcinit.o: jcinit.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jcinit.c) -o $(call quote_path,$@)

$(OBJ)jcmainct.o: jcmainct.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jcmainct.c) -o $(call quote_path,$@)

$(OBJ)jcmarker.o: jcmarker.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jcmarker.c) -o $(call quote_path,$@)

$(OBJ)jcmaster.o: jcmaster.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jcmaster.c) -o $(call quote_path,$@)

$(OBJ)jcomapi.o: jcomapi.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jcomapi.c) -o $(call quote_path,$@)

$(OBJ)jcparam.o: jcparam.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jcparam.c) -o $(call quote_path,$@)

$(OBJ)jcprepct.o: jcprepct.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jcprepct.c) -o $(call quote_path,$@)

$(OBJ)jcsample.o: jcsample.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jcsample.c) -o $(call quote_path,$@)

$(OBJ)jctrans.o: jctrans.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jctrans.c) -o $(call quote_path,$@)

$(OBJ)jdapimin.o: jdapimin.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jdapimin.c) -o $(call quote_path,$@)

$(OBJ)jdapistd.o: jdapistd.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jdapistd.c) -o $(call quote_path,$@)

$(OBJ)jdatadst.o: jdatadst.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jdatadst.c) -o $(call quote_path,$@)

$(OBJ)jdatasrc.o: jdatasrc.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jdatasrc.c) -o $(call quote_path,$@)

$(OBJ)jdcoefct.o: jdcoefct.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jdcoefct.c) -o $(call quote_path,$@)

$(OBJ)jdcolor.o: jdcolor.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jdcolor.c) -o $(call quote_path,$@)

$(OBJ)jddctmgr.o: jddctmgr.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jddctmgr.c) -o $(call quote_path,$@)

$(OBJ)jdhuff.o: jdhuff.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jdhuff.c) -o $(call quote_path,$@)

$(OBJ)jdinput.o: jdinput.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jdinput.c) -o $(call quote_path,$@)

$(OBJ)jdmainct.o: jdmainct.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jdmainct.c) -o $(call quote_path,$@)

$(OBJ)jdmarker.o: jdmarker.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jdmarker.c) -o $(call quote_path,$@)

$(OBJ)jdmaster.o: jdmaster.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jdmaster.c) -o $(call quote_path,$@)

$(OBJ)jdmerge.o: jdmerge.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jdmerge.c) -o $(call quote_path,$@)

$(OBJ)jdpostct.o: jdpostct.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jdpostct.c) -o $(call quote_path,$@)

$(OBJ)jdsample.o: jdsample.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jdsample.c) -o $(call quote_path,$@)

$(OBJ)jdtrans.o: jdtrans.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jdtrans.c) -o $(call quote_path,$@)

$(OBJ)jerror.o: jerror.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jerror.c) -o $(call quote_path,$@)

$(OBJ)jfdctflt.o: jfdctflt.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jfdctflt.c) -o $(call quote_path,$@)

$(OBJ)jfdctfst.o: jfdctfst.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jfdctfst.c) -o $(call quote_path,$@)

$(OBJ)jfdctint.o: jfdctint.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jfdctint.c) -o $(call quote_path,$@)

$(OBJ)jidctflt.o: jidctflt.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jidctflt.c) -o $(call quote_path,$@)

$(OBJ)jidctfst.o: jidctfst.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jidctfst.c) -o $(call quote_path,$@)

$(OBJ)jidctint.o: jidctint.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jidctint.c) -o $(call quote_path,$@)

$(OBJ)jquant1.o: jquant1.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jquant1.c) -o $(call quote_path,$@)

$(OBJ)jquant2.o: jquant2.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jquant2.c) -o $(call quote_path,$@)

$(OBJ)jutils.o: jutils.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jutils.c) -o $(call quote_path,$@)

$(OBJ)jaricom.o: jaricom.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jaricom.c) -o $(call quote_path,$@)

$(OBJ)jcarith.o: jcarith.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jcarith.c) -o $(call quote_path,$@)

$(OBJ)jdarith.o: jdarith.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jdarith.c) -o $(call quote_path,$@)

$(OBJ)jmemmgr.o: jmemmgr.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jmemmgr.c) -o $(call quote_path,$@)

$(OBJ)jmemnobs.o: jmemnobs.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,jmemnobs.c) -o $(call quote_path,$@)

$(OBJ)transupp.o: transupp.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,transupp.c) -o $(call quote_path,$@)

cleantarget:
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
	$(call rm,$(_OBJECTS1))
	$(call rm,$(_OBJECTS2))

realclean: cleantarget
	$(call rmr,$(OBJ))

distclean:
	$(_MAKE) -f $(_CF_DIR)Cleanfile distclean distclean_all_subdirs

Makefile: ;
$(_CF_DIR)crossplatform.mk: ;
$(_CF_DIR)default.cf: ;
