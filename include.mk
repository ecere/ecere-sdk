
# DETECTION
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

# PLATFORM
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

# TOOLS
empty :=
space := $(empty) $(empty)
fixspace = $(subst $(space),\$(space),$1)
hidspace = $(subst $(space),^,$1)
shwspace = $(subst ^,$(space),$1)
ifdef WINDOWS
   fixps = $(subst \,/,$(1))
   psep = $(subst \\,/,$(subst /,\,$(1)))
   PS := $(strip \)
   SODESTDIR := obj/$(PLATFORM)/bin/
else
   fixps = $(1)
   PS := $(strip /)
   psep = $(1)
   SODESTDIR := obj/$(PLATFORM)/lib/
endif

# EXTENSIONS
.SUFFIXES: .c .ec .sym .imp .o
S := .sym
I := .imp
O := .o
A := .a

# PREFIXES AND POSTFIXES
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

# SHELL COMMANDS
ifdef WINDOWS
   echo = $(if $(1),echo $(1))
   cpq = $(if $(1),@cmd /c for %%I in ($(call psep,$(1))) do @copy /y %%I $(call psep,$(2)) > nul 2>&1)
   rmq = $(if $(1),-@del /f /q $(call psep,$(1)) > nul 2>&1)
   rmrq = $(if $(1),-@rmdir /q /s $(call psep,$(1)) > nul 2>&1)
   mkdirq = $(if $(1),-@mkdir $(call psep,$(1)) > nul 2>&1)
   rmdirq = $(if $(1),-@rmdir /q $(call psep,$(1)) > nul 2>&1)
else
ifdef OSX
   echo = $(if $(1),echo "$(1)")
   cpq = $(if $(1),cp $(1) $(2))
   rmq = $(if $(1),-rm -f $(1))
   rmrq = $(if $(1),-rm -f -r $(1))
   mkdirq = $(if $(1),-mkdir -p $(1))
   rmdirq = $(if $(1),-rmdir $(1))
else
   echo = $(if $(1),echo "$(1)")
   cpq = $(if $(1),@cp $(1) $(2))
   rmq = $(if $(1),-@rm -f $(1))
   rmrq = $(if $(1),-@rm -f -r $(1))
   mkdirq = $(if $(1),-@mkdir -p $(1))
   rmdirq = $(if $(1),-@rmdir $(1))
endif
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
   STRIPOPT := -x
endif
