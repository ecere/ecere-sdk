# HOST PLATFORM DETECTION
ifeq "$(OS)" "Windows_NT"
   HOST_PLATFORM := win32
   WINDOWS_HOST := defined
else
 _UNAME := $(shell uname)
 UNAME_P := $(shell uname -p)
 ifeq "$(_UNAME)" "FreeBSD"
 # Using Linux platform for Unix OSes for now 
 #   HOST_PLATFORM := bsd
    BSD_HOST := defined
    HOST_PLATFORM := linux
    LINUX_HOST := defined
 else
  ifeq "$(_UNAME)" "Darwin"
     HOST_PLATFORM := apple
     OSX_HOST := defined
  else
     HOST_PLATFORM := linux
     LINUX_HOST := defined
  endif
 endif
 HOST_ARCH := $(UNAME_P)
endif

# TARGET_PLATFORM
ifndef TARGET_PLATFORM
ifdef PLATFORM
   TARGET_PLATFORM := $(PLATFORM)
endif
endif
ifndef TARGET_PLATFORM
ifdef WINDOWS_HOST
   TARGET_PLATFORM := win32
else
ifdef OSX_HOST
   TARGET_PLATFORM := apple
else
#ifdef BSD_HOST
#   TARGET_PLATFORM := bsd
#else
   TARGET_PLATFORM := linux
ifdef BSD_HOST
   BSD_TARGET := defined
endif
#endif
endif
endif
endif
ifndef PLATFORM
   PLATFORM := $(TARGET_PLATFORM)
endif
ifeq "$(TARGET_PLATFORM)" "win32"
   WINDOWS_TARGET := defined
else
ifeq "$(TARGET_PLATFORM)" "apple"
   OSX_TARGET := defined
else
#ifeq "$(TARGET_PLATFORM)" "bsd"
#   BSD_TARGET := defined
#else
   LINUX_TARGET := defined
#endif
endif
endif

# CROSS_TARGET
ifneq "$(TARGET_PLATFORM)" "$(HOST_PLATFORM)"
   CROSS_TARGET := defined
endif

# TARGET_TYPE
ifeq "$(TARGET_TYPE)" "staticlib"
   STATIC_LIBRARY_TARGET := defined
else
ifeq "$(TARGET_TYPE)" "sharedlib"
   SHARED_LIBRARY_TARGET := defined
else
ifeq "$(TARGET_TYPE)" "executable"
   EXECUTABLE_TARGET := defined
endif
endif
endif

ifeq "$(GCC_PREFIX)" "i586-mingw32msvc-"
export ARCH
ARCH := x32
endif

ifeq "$(GCC_PREFIX)" "i686-w64-mingw32-"
export ARCH
ARCH := x32
endif

# Accept different things for ARCH but standardize on x32/x64
# This will be used for object directories
ifdef ARCH
 ifeq "$(ARCH)" "32"
  override ARCH := x32
 endif
 ifeq "$(ARCH)" "x86"
  override ARCH := x32
 endif
 ifeq "$(ARCH)" "i386"
  override ARCH := x32
 endif
 ifeq "$(ARCH)" "i686"
  override ARCH := x32
 endif
 ifeq "$(ARCH)" "64"
  override ARCH := x64
 endif
 ifeq "$(ARCH)" "amd64"
  override ARCH := x64
 endif
 ifeq "$(ARCH)" "x86_64"
  override ARCH := x64
 endif

 # Set ARCH_FLAGS only if ARCH is set
 ifeq "$(ARCH)" "x64"
  TARGET_ARCH := x86_64
  ARCH_FLAGS := -m64
 endif
 ifeq "$(ARCH)" "x32"
  TARGET_ARCH := i386
  ARCH_FLAGS := -m32
 endif

 ARCH_SUFFIX := .$(ARCH)

 ifdef LINUX_TARGET
  TARGET_ARCH := $(TARGET_ARCH)-linux-gnu
 endif

endif

# DEBUG SUFFIX
ifdef DEBUG
DEBUG_SUFFIX := .debug
endif

# COMPILER SUFFIX
COMPILER_SUFFIX = $(ARCH_SUFFIX)
ifdef COMPILER
ifneq "$(COMPILER)" "default"
COMPILER_SUFFIX = .$(COMPILER)$(ARCH_SUFFIX)
endif
endif

# MISC STRING TOOLS
empty :=
space := $(empty) $(empty)
comma := ,
escspace = $(subst $(space),\$(space),$(subst \$(space),$(space),$1))
hidspace = $(subst $(space),,$(subst \$(space),,$1))
shwspace = $(subst ,\$(space),$1)

# PATH SEPARATOR STRING TOOLS
ifdef WINDOWS_HOST
ifndef MSYSCON
   WIN_PS_TOOLS := defined
endif
endif
ifdef WIN_PS_TOOLS
   fixps = $(subst \,/,$(1))
   psep = $(subst \\,/,$(subst /,\,$(1)))
   PS := $(strip \)
else
   fixps = $(1)
   PS := $(strip /)
   psep = $(1)
endif

# PREFIXES AND EXTENSIONS
.SUFFIXES: .c .ec .sym .imp .bowl .o .a
EC := .ec
S := .sym
I := .imp
B := .bowl
C := .c
O := .o
A := .a
E := $(if $(WINDOWS_TARGET),.exe,)
SO := $(if $(WINDOWS_TARGET),.dll,$(if $(OSX_TARGET),.dylib,.so))
LP := $(if $(WINDOWS_TARGET),$(if $(STATIC_LIBRARY_TARGET),lib,),lib)
HOST_E := $(if $(WINDOWS_HOST),.exe,)
HOST_SO := $(if $(WINDOWS_HOST),.dll,$(if $(OSX_HOST),.dylib,.so))
HOST_LP := $(if $(WINDOWS_HOST),$(if $(STATIC_LIBRARY_TARGET),lib,),lib)

# SUPER TOOLS
ifdef CCACHE
   CCACHE_COMPILE := ccache$(space)
ifdef DISTCC
   DISTCC_COMPILE := distcc$(space)
endif
else
ifdef DISTCC
   DISTCC_COMPILE := distcc$(space)
endif
endif

_CPP = $(if $(findstring $(space),$(CPP)),"$(CPP)",$(CPP))

_SYSROOT = $(if $(SYSROOT),$(space)--sysroot=$(SYSROOT),)

# SHELL COMMANDS
ifdef WINDOWS_HOST
ifndef MSYSCON
   WIN_SHELL_COMMANDS := defined
endif
endif
ifdef WIN_SHELL_COMMANDS
   echo = $(if $(1),echo $(1))
   cpq = $(if $(1),@cmd /c for %%I in ($(call psep,$(1))) do @copy /y %%I $(call psep,$(2)) > nul 2>&1)
   rmq = $(if $(1),-@del /f /q $(call psep,$(1)) > nul 2>&1)
   rmrq = $(if $(1),-@rmdir /q /s $(call psep,$(1)) > nul 2>&1)
   mkdirq = $(if $(1),-@mkdir $(call psep,$(1)) > nul 2>&1)
   rmdirq = $(if $(1),-@rmdir /q $(call psep,$(1)) > nul 2>&1)
else
   echo = $(if $(1),echo "$(1)")
   cpq = $(if $(1),@cp $(1) $(2))
   rmq = $(if $(1),-@rm -f $(1))
   rmrq = $(if $(1),-@rm -f -r $(1))
   mkdirq = $(if $(1),-@mkdir -p $(1))
   rmdirq = $(if $(1),-@rmdir $(1))
endif

# COMPILER OPTIONS
ECSLIBOPT := $(if $(STATIC_LIBRARY_TARGET),-staticlib,$(if $(SHARED_LIBRARY_TARGET),-dynamiclib,))
FVISIBILITY := $(if $(WINDOWS_TARGET),,-fvisibility=hidden)
FPIC := $(if $(WINDOWS_TARGET),,-fPIC)
EXECUTABLE := $(if $(WINDOWS_TARGET),$(if $(EXECUTABLE_TARGET),$(CONSOLE),),)
INSTALLNAME := $(if $(OSX_TARGET),$(if $(STATIC_LIBRARY_TARGET),-install_name $(LP)$(MODULE)$(SO),),)

# LINKER OPTIONS
SHAREDLIB := $(if $(SHARED_LIBRARY_TARGET),$(if $(OSX_TARGET),-dynamiclib -single_module -multiply_defined suppress,-shared),)
LINKOPT :=
STRIPOPT := $(if $(OSX_TARGET),$(if $(SHARED_LIBRARY_TARGET),-x, -u -r), -x --strip-unneeded --remove-section=.comment --remove-section=.note)
HOST_SODESTDIR := $(if $(WINDOWS_HOST),obj/$(HOST_PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/bin/,obj/$(HOST_PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/lib/)
SODESTDIR := $(if $(WINDOWS_TARGET),obj/$(TARGET_PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/bin/,obj/$(TARGET_PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/lib/)

# EXCLUDED_LIBS TOOL
_L = $(if $(filter $(1),$(EXCLUDED_LIBS)),,-l$(1))

# DEBIAN
ifdef DEBIAN_PACKAGE
CFLAGS += $(CPPFLAGS)
endif

ifdef DEBUG
CFLAGS += -D_DEBUG
endif

# COMMON LIBRARIES DETECTION
ifdef WINDOWS_TARGET
 ifdef OPENSSL_CONF
  _OPENSSL_CONF = $(call hidspace,$(call fixps,$(OPENSSL_CONF)))
  OPENSSL_INCLUDE_DIR = $(call shwspace,$(subst /bin/openssl.cfg,/include,$(_OPENSSL_CONF)))
  OPENSSL_LIB_DIR = $(call shwspace,$(subst /bin/openssl.cfg,/lib,$(_OPENSSL_CONF)))
  OPENSSL_BIN_DIR = $(call shwspace,$(subst /bin/openssl.cfg,/bin,$(_OPENSSL_CONF)))
 else
# to avoid issues with empty -L/-I
  OPENSSL_INCLUDE_DIR = .
  OPENSSL_LIB_DIR = .
  OPENSSL_BIN_DIR = .
 endif
endif
