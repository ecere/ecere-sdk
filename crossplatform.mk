# HOST PLATFORM DETECTION
ifeq "$(OS)" "Windows_NT"
   WINDOWS = defined
else
ifeq "$(OSTYPE)" "FreeBSD"
   BSD = defined
else
ifeq "$(shell uname)" "Darwin"
   OSX = defined
else
   LINUX = defined
endif
endif
endif

# PLATFORM (TARGET)
ifndef PLATFORM
ifdef WINDOWS
   PLATFORM := win32
else
ifdef OSX
   PLATFORM := apple
else
   PLATFORM := linux
endif
endif
endif

# DEBUG SUFFIX
ifdef DEBUG
DEBUG_SUFFIX := .debug
endif

ifdef COMPILER
ifneq "$(COMPILER)" "default"
COMPILER_SUFFIX := .$(COMPILER)
endif
endif

# MISC STRING TOOLS
empty :=
space := $(empty) $(empty)
escspace = $(subst $(space),\$(space),$(subst \$(space),$(space),$1))
hidspace = $(subst $(space),,$(subst \$(space),,$1))
shwspace = $(subst ,\$(space),$1)

# PATH SEPARATOR STRING TOOLS
ifdef WINDOWS
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
ifeq "$(PLATFORM)" "win32"
   E := .exe
ifeq "$(TARGET_TYPE)" "staticlib"
   LP := lib
else
   LP :=
endif
   SO := .dll
else
ifeq "$(PLATFORM)" "apple"
   E :=
   LP := lib
   SO := .dylib
else
   E :=
   LP := lib
   SO := .so
endif
endif

# SUPER TOOLS
ifdef CCACHE
   CCACHE_COMPILE := ccache
ifdef DISTCC
   DISTCC_COMPILE := distcc
endif
else
ifdef DISTCC
   DISTCC_COMPILE := distcc
endif
endif

# SHELL COMMANDS
ifdef WINDOWS
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
ifeq "$(TARGET_TYPE)" "sharedlib"
   ECSLIBOPT := -dynamiclib
else
ifeq "$(TARGET_TYPE)" "staticlib"
   ECSLIBOPT := -staticlib
else
   ECSLIBOPT :=
endif
endif
ifdef WINDOWS
   FVISIBILITY :=
   FPIC :=
ifeq "$(TARGET_TYPE)" "executable"
   EXECUTABLE := $(CONSOLE)
else
   EXECUTABLE :=
endif
else
   FVISIBILITY := -fvisibility=hidden
   FPIC := -fPIC
   EXECUTABLE :=
endif
ifdef OSX
ifeq "$(TARGET_TYPE)" "sharedlib"
   INSTALLNAME := -install_name $(LP)$(MODULE)$(SO)
else
   INSTALLNAME :=
endif
else
   INSTALLNAME :=
endif

# LINKER OPTIONS
ifdef OSX
ifeq "$(TARGET_TYPE)" "sharedlib"
   SHAREDLIB := -dynamiclib -single_module -multiply_defined suppress
   LINKOPT :=
else
   SHAREDLIB :=
   LINKOPT :=
endif
ifeq "$(TARGET_TYPE)" "sharedlib"
   STRIPOPT := -x
else
   STRIPOPT := -u -r
endif
else
ifeq "$(TARGET_TYPE)" "sharedlib"
   SHAREDLIB := -shared
else
   SHAREDLIB :=
endif
   LINKOPT :=
   STRIPOPT := -x --strip-unneeded --remove-section=.comment --remove-section=.note
endif
ifdef WINDOWS
   SODESTDIR := obj/$(PLATFORM)/bin/
else
   SODESTDIR := obj/$(PLATFORM)/lib/
endif

_L = $(if $(filter $(1),$(EXCLUDED_LIBS)),,-l$(1))

# COMMON LIBRARIES DETECTION

ifdef WINDOWS

ifdef OPENSSL_CONF
_OPENSSL_CONF = $(call hidspace,$(call fixps,$(OPENSSL_CONF)))
OPENSSL_INCLUDE_DIR = $(call shwspace,$(subst /bin/openssl.cfg,/include,$(_OPENSSL_CONF)))
OPENSSL_LIB_DIR = $(call shwspace,$(subst /bin/openssl.cfg,/lib,$(_OPENSSL_CONF)))
OPENSSL_BIN_DIR = $(call shwspace,$(subst /bin/openssl.cfg,/bin,$(_OPENSSL_CONF)))
else
# To avoid confusion with empty -L/-I
OPENSSL_INCLUDE_DIR = .
OPENSSL_LIB_DIR = .
OPENSSL_BIN_DIR = .
endif

else

OFLAGS += -L/usr/lib/ec

endif
