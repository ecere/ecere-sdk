# TOOLCHAIN
export CC      = $(CCACHE_COMPILE) $(DISTCC_COMPILE) gcc
export CPP     = $(CCACHE_COMPILE) $(DISTCC_COMPILE) cpp
export ECP     = ecp
export ECC     = ecc
export ECS     = ecs
export EAR     = ear
export AS      = as
export LD      = ld
export AR      = ar
export STRIP   = strip
UPX := upx

# DEBIAN
ifdef DEBIAN_PACKAGE
CFLAGS += $(CPPFLAGS)
OFLAGS += $(LDFLAGS)
endif
