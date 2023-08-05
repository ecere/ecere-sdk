.PHONY: all objdir cleantarget clean realclean distclean

# CORE VARIABLES

MODULE := lzma
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

_CF_DIR = .configs/

GNOSIS3_ABSPATH := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))../../

ifndef ECERE_SDK_SRC
ECERE_SDK_SRC := $(GNOSIS3_ABSPATH)../ecere-sdk
endif

_CF_DIR = $(ECERE_SDK_SRC)/
include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)default.cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES = 

TARGET_NAME := 7z-lzma

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)$(TARGET_NAME)$(OUT)

_OBJECTS = $(_OBJECTS1) $(_OBJECTS2)
_OBJECTS1 = \
	$(OBJ)7zAlloc$(O) \
	$(OBJ)7zArcIn$(O) \
	$(OBJ)7zBuf$(O) \
	$(OBJ)7zBuf2$(O) \
	$(OBJ)7zCrc$(O) \
	$(OBJ)7zCrcOpt$(O) \
	$(OBJ)7zDec$(O) \
	$(OBJ)7zFile$(O) \
	$(OBJ)7zStream$(O) \
	$(OBJ)Aes$(O) \
	$(OBJ)AesOpt$(O) \
	$(OBJ)Alloc$(O) \
	$(OBJ)Bcj2$(O) \
	$(OBJ)Bcj2Enc$(O) \
	$(OBJ)Bra$(O) \
	$(OBJ)Bra86$(O) \
	$(OBJ)BraIA64$(O) \
	$(OBJ)CpuArch$(O) \
	$(OBJ)Delta$(O) \
	$(OBJ)DllSecur$(O) \
	$(OBJ)LzFind$(O) \
	$(OBJ)LzFindOpt$(O) \
	$(OBJ)Lzma2Dec$(O) \
	$(OBJ)Lzma2Enc$(O) \
	$(OBJ)Lzma86Dec$(O) \
	$(OBJ)Lzma86Enc$(O) \
	$(OBJ)LzmaDec$(O) \
	$(OBJ)LzmaEnc$(O) \
	$(OBJ)LzmaLib$(O) \
	$(OBJ)MtCoder$(O) \
	$(OBJ)MtDec$(O)
_OBJECTS2 = \
	$(OBJ)Ppmd7$(O) \
	$(OBJ)Ppmd7Dec$(O) \
	$(OBJ)Ppmd7Enc$(O) \
	$(OBJ)Sort$(O)

OBJECTS = $(_OBJECTS)

SOURCES = \
	7zAlloc.c \
	7zArcIn.c \
	7zBuf.c \
	7zBuf2.c \
	7zCrc.c \
	7zCrcOpt.c \
	7zDec.c \
	7zFile.c \
	7zStream.c \
	Aes.c \
	AesOpt.c \
	Alloc.c \
	Bcj2.c \
	Bcj2Enc.c \
	Bra.c \
	Bra86.c \
	BraIA64.c \
	CpuArch.c \
	Delta.c \
	DllSecur.c \
	LzFind.c \
	LzFindOpt.c \
	Lzma2Dec.c \
	Lzma2Enc.c \
	Lzma86Dec.c \
	Lzma86Enc.c \
	LzmaDec.c \
	LzmaEnc.c \
	LzmaLib.c \
	MtCoder.c \
	MtDec.c \
	Ppmd7.c \
	Ppmd7Dec.c \
	Ppmd7Enc.c \
	Sort.c

RESOURCES =

ifdef USE_RESOURCES_EAR
RESOURCES_EAR =
else
RESOURCES_EAR = $(RESOURCES)
endif

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -Wall -DREPOSITORY_VERSION="\"$(REPOSITORY_VER)\"" \
			 -DFLT_DS_LOAD \
			 -DIMPORT_STATIC=\"\" \
			 -D_7ZIP_ST \
			 -I.

ECFLAGS += -module $(MODULE)
CECFLAGS += -cpp $(_CPP)

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdir,$(OBJ)))

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RESOURCES_EAR) $(SYMBOLS) $(OBJECTS) | objdir
	@$(call rm,$(OBJ)objects.lst)
	@$(call touch,$(OBJ)objects.lst)
	$(call addtolistfile,$(_OBJECTS1),$(OBJ)objects.lst)
	$(call addtolistfile,$(_OBJECTS2),$(OBJ)objects.lst)
ifndef STATIC_LIBRARY_TARGET
	$(LD) $(OFLAGS) @$(OBJ)objects.lst $(LIBS) -o $(TARGET) $(INSTALLNAME) $(SONAME)
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

$(OBJ)7zAlloc$(O): 7zAlloc.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,7zAlloc.c) -o $(call quote_path,$@)

$(OBJ)7zArcIn$(O): 7zArcIn.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,7zArcIn.c) -o $(call quote_path,$@)

$(OBJ)7zBuf$(O): 7zBuf.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,7zBuf.c) -o $(call quote_path,$@)

$(OBJ)7zBuf2$(O): 7zBuf2.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,7zBuf2.c) -o $(call quote_path,$@)

$(OBJ)7zCrc$(O): 7zCrc.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,7zCrc.c) -o $(call quote_path,$@)

$(OBJ)7zCrcOpt$(O): 7zCrcOpt.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,7zCrcOpt.c) -o $(call quote_path,$@)

$(OBJ)7zDec$(O): 7zDec.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,7zDec.c) -o $(call quote_path,$@)

$(OBJ)7zFile$(O): 7zFile.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,7zFile.c) -o $(call quote_path,$@)

$(OBJ)7zStream$(O): 7zStream.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,7zStream.c) -o $(call quote_path,$@)

$(OBJ)Aes$(O): Aes.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,Aes.c) -o $(call quote_path,$@)

$(OBJ)AesOpt$(O): AesOpt.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,AesOpt.c) -o $(call quote_path,$@)

$(OBJ)Alloc$(O): Alloc.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,Alloc.c) -o $(call quote_path,$@)

$(OBJ)Bcj2$(O): Bcj2.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,Bcj2.c) -o $(call quote_path,$@)

$(OBJ)Bcj2Enc$(O): Bcj2Enc.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,Bcj2Enc.c) -o $(call quote_path,$@)

$(OBJ)Bra$(O): Bra.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,Bra.c) -o $(call quote_path,$@)

$(OBJ)Bra86$(O): Bra86.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,Bra86.c) -o $(call quote_path,$@)

$(OBJ)BraIA64$(O): BraIA64.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,BraIA64.c) -o $(call quote_path,$@)

$(OBJ)CpuArch$(O): CpuArch.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,CpuArch.c) -o $(call quote_path,$@)

$(OBJ)Delta$(O): Delta.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,Delta.c) -o $(call quote_path,$@)

$(OBJ)DllSecur$(O): DllSecur.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,DllSecur.c) -o $(call quote_path,$@)

$(OBJ)LzFind$(O): LzFind.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,LzFind.c) -o $(call quote_path,$@)

$(OBJ)LzFindOpt$(O): LzFindOpt.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,LzFindOpt.c) -o $(call quote_path,$@)

$(OBJ)Lzma2Dec$(O): Lzma2Dec.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,Lzma2Dec.c) -o $(call quote_path,$@)

$(OBJ)Lzma2Enc$(O): Lzma2Enc.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,Lzma2Enc.c) -o $(call quote_path,$@)

$(OBJ)Lzma86Dec$(O): Lzma86Dec.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,Lzma86Dec.c) -o $(call quote_path,$@)

$(OBJ)Lzma86Enc$(O): Lzma86Enc.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,Lzma86Enc.c) -o $(call quote_path,$@)

$(OBJ)LzmaDec$(O): LzmaDec.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,LzmaDec.c) -o $(call quote_path,$@)

$(OBJ)LzmaEnc$(O): LzmaEnc.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,LzmaEnc.c) -o $(call quote_path,$@)

$(OBJ)LzmaLib$(O): LzmaLib.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,LzmaLib.c) -o $(call quote_path,$@)

$(OBJ)MtCoder$(O): MtCoder.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,MtCoder.c) -o $(call quote_path,$@)

$(OBJ)MtDec$(O): MtDec.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,MtDec.c) -o $(call quote_path,$@)

$(OBJ)Ppmd7$(O): Ppmd7.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,Ppmd7.c) -o $(call quote_path,$@)

$(OBJ)Ppmd7Dec$(O): Ppmd7Dec.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,Ppmd7Dec.c) -o $(call quote_path,$@)

$(OBJ)Ppmd7Enc$(O): Ppmd7Enc.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,Ppmd7Enc.c) -o $(call quote_path,$@)

$(OBJ)Sort$(O): Sort.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,Sort.c) -o $(call quote_path,$@)

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

distclean: cleantarget
	$(call rmr,obj/)
	$(call rmr,.configs/)
	$(call rm,*.ews)
	$(call rm,*.Makefile)
