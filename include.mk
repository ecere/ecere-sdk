# TOOLCHAIN
export CC      = $(CCACHE_COMPILE)$(DISTCC_COMPILE)$(GCC_PREFIX)gcc$(_SYSROOT)
export CPP     = $(CCACHE_COMPILE)$(DISTCC_COMPILE)$(GCC_PREFIX)cpp$(_SYSROOT)
export ECP     = ecp
export ECC     = ecc
export ECS     = %s$(if $(CROSS_TARGET), -t $(TARGET_PLATFORM),)
export EAR     = ear
export AS      = $(GCC_PREFIX)as
export LD      = $(GCC_PREFIX)ld
export AR      = $(GCC_PREFIX)ar
export STRIP   = $(GCC_PREFIX)strip
UPX := upx

# DEBIAN
ifdef DEBIAN_PACKAGE
CFLAGS += $(CPPFLAGS)
endif

ifeq "$(HOST_ARCH)" "ARM"
FORCE_64_BIT =
FORCE_32_BIT =
else
FORCE_64_BIT = -m64
FORCE_32_BIT = -m32
endif

# HARD CODED PLATFORM-SPECIFIC OPTIONS
LDFLAGS +=$(if $(LINUX_TARGET), -Wl,--no-undefined,)
LDFLAGS +=$(if $(OSX_TARGET), -framework cocoa -framework OpenGL,)

# FLAGS

UPXFLAGS = -9 -q

CFLAGS += -fmessage-length=0

EARFLAGS = awq
