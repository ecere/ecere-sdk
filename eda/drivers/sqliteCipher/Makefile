.PHONY: all objdir clean realclean distclean

# CONTENT

MODULE := EDASQLiteCipher
CONFIG := release
COMPILER := default
TARGET_TYPE = sharedlib

OBJ = obj/$(CONFIG).$(PLATFORM)/

RES = 

# CROSS-PLATFORM MAGIC

include ../../../include.mk

ifdef LINUX
TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)EDASQLiteCipher$(SO).0.44
SONAME = -Wl,-soname,$(LP)EDASQLiteCipher$(SO).0
else
TARGET = obj/$(CONFIG).$(PLATFORM)/$(LP)EDASQLiteCipher$(SO)
SONAME =
endif

OBJECTS = $(OBJ)sqlite3.o $(OBJ)EDASQLiteCipher.o $(OBJ)EDASQLiteCommon.o \
	$(OBJ)$(MODULE).main$(O)

COBJECTS = $(OBJ)EDASQLiteCipher.c $(OBJ)EDASQLiteCommon.c

SYMBOLS = $(OBJ)EDASQLiteCipher.sym $(OBJ)EDASQLiteCommon.sym

IMPORTS = $(OBJ)EDASQLiteCipher.imp $(OBJ)EDASQLiteCommon.imp

SOURCES = sqlite3.c EDASQLiteCipher.ec ../sqlite/EDASQLiteCommon.ec

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

CFLAGS = -fmessage-length=0 -O2 -m32 $(FPIC) -w \
	 -DSQLITE_HAS_CODEC

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

ifdef WINDOWS

_SSL_CONF = $(call hidspace,$(call fixps,$(OPENSSL_CONF)))
_SSL_BIN = $(_SSL_CONF:$(notdir $(_SSL_CONF))=$(empty))
_SSL_INC_DIR = $(call fixspace,$(call shwspace,$(subst /bin,/include,$(_SSL_BIN))))
_SSL_LIB_DIR = $(call fixspace,$(call shwspace,$(subst /bin,/lib,$(_SSL_BIN))))
_SSL_BIN_DIR = $(call fixspace,$(call shwspace,$(_SSL_BIN)))

#	@$(call echo,OPENSSL_CONF $(OPENSSL_CONF))
#	@$(call echo,_SSL_CONF $(_SSL_CONF))
#	@$(call echo,_SSL_INC_DIR $(_SSL_INC_DIR))
#	@$(call echo,_SSL_BIN_DIR $(_SSL_BIN_DIR))
#	@$(call echo,_SSL_LIB_DIR $(_SSL_LIB_DIR))

CFLAGS += \
	 -I$(_SSL_INC_DIR)

OFLAGS += \
	 -L$(_SSL_BIN_DIR)

LIBS += -llibeay32

else
ifdef LINUX

LIBS += -lpthread -ldl -llibssl

else
ifdef OSX

LIBS += -lpthread -ldl -llibssl

endif
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

$(OBJ)EDASQLiteCipher.sym: EDASQLiteCipher.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c EDASQLiteCipher.ec -o $(OBJ)EDASQLiteCipher.sym

$(OBJ)EDASQLiteCommon.sym: ../sqlite/EDASQLiteCommon.ec
	$(ECP) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) -c ../sqlite/EDASQLiteCommon.ec -o $(OBJ)EDASQLiteCommon.sym

# C OBJECT RULES

$(OBJ)EDASQLiteCipher.c: EDASQLiteCipher.ec $(OBJ)EDASQLiteCipher.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c EDASQLiteCipher.ec -o $(OBJ)EDASQLiteCipher.c -symbols $(OBJ)

$(OBJ)EDASQLiteCommon.c: ../sqlite/EDASQLiteCommon.ec $(OBJ)EDASQLiteCommon.sym | $(SYMBOLS)
	$(ECC) $(CECFLAGS) $(ECFLAGS) $(CFLAGS) $(FVISIBILITY) -c ../sqlite/EDASQLiteCommon.ec -o $(OBJ)EDASQLiteCommon.c -symbols $(OBJ)

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
