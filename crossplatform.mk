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

# On Windows/32 bit systems, pass -m32 as TDM-GCC packaged with the installer produces 64 bit executables by default
# Disable this if your compiler does not accept -m32
ifndef ARCH
 ifeq "$(HOST_PLATFORM)" "win32"
  ifeq "$(TARGET_PLATFORM)" "win32"
   ifndef ProgramFiles(x86)
    ARCH := x32
    TARGET_ARCH := i386
    ARCH_FLAGS := -m32
   endif
  endif
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
esc := $(empty)$(empty)
space := $(empty) $(empty)
comma := ,
slash := $(empty)/$(empty)
backslash := $(empty)\$(empty)
escspace = $(subst $(space),$(backslash)$(space),$(subst $(backslash)$(space),$(space),$(1)))
hidspace = $(subst $(space),$(esc),$(subst $(backslash)$(space),$(esc),$(1)))
shwspace = $(subst $(esc),$(backslash)$(space),$(1))
unescp_all = $(subst $(esc),$(backslash),$(subst $(backslash),,$(subst $(backslash)$(backslash),$(esc),$(1))))

# PATH SEPARATOR STRING TOOLS
ifdef WINDOWS_HOST
ifndef MSYSCON
   WIN_PS_TOOLS := defined
endif
endif
ifdef WIN_PS_TOOLS
   psep := $(backslash)
   slash_path = $(subst $(backslash),$(slash),$(1))
   sys_path = $(subst $(backslash)$(backslash),$(slash),$(subst $(slash),$(backslash),$(1)))
   quote_path = "$(call sys_path,$(call unescp_all,$(1)))"
   each_path_quote = $(if $(findstring $(esc),$(path)),"$(call unescp_all,$(call shwspace,$(path)))",$(call unescp_all,$(path)))
   sys_path_list = $(foreach path,$(1),$(each_path_quote))
else
   psep := $(slash)
   slash_path = $(1)
   sys_path = $(1)
   quote_path = $(1)
endif

# PREFIXES AND EXTENSIONS
EC := .ec
S := .sym
I := .imp
B := .bowl
C := .c
ifndef O
O := .o
endif
A := .a
E := $(if $(WINDOWS_TARGET),.exe,)
SO := $(if $(WINDOWS_TARGET),.dll,$(if $(OSX_TARGET),.dylib,.so))
LP := $(if $(WINDOWS_TARGET),$(if $(STATIC_LIBRARY_TARGET),lib,),lib)
HOST_E := $(if $(WINDOWS_HOST),.exe,)
HOST_SO := $(if $(WINDOWS_HOST),.dll,$(if $(OSX_HOST),.dylib,.so))
HOST_LP := $(if $(WINDOWS_HOST),$(if $(STATIC_LIBRARY_TARGET),lib,),lib)
.SUFFIXES: .c .ec .sym .imp .bowl $(O) $(A)

# TARGET VERSION
VER := $(if $(LINUX_TARGET),$(if $(LINUX_HOST),$(if $(VERSION),.$(VERSION),),),)

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
   nullerror = 2>NUL
   echo = $(if $(1),echo $(1))
   touch = $(if $(1),@cmd /c "for %%I in ($(call sys_path,$(1))) do @(cd %%~pI && type nul >> %%~nxI && copy /by %%~nxI+,, > nul 2>&1 && cd %%cd%%)")
   cpq = $(if $(1),@cmd /c "for %%I in ($(call sys_path,$(1))) do copy /by %%I $(call sys_path,$(2))" > nul 2>&1)
   cpv = $(if $(1),@cmd /c "for %%I in ($(call sys_path,$(1))) do copy /by %%I $(call sys_path,$(2))")
   rmq = $(if $(1),-del /f /q $(call sys_path,$(call sys_path_list,$(1))) > nul 2>&1)
   rmrq = $(if $(1),-rmdir /q /s $(call sys_path,$(1)) > nul 2>&1)
   mkdirq = $(if $(1),-mkdir $(call sys_path,$(1)) > nul 2>&1)
   rmdirq = $(if $(1),-rmdir /q $(call sys_path,$(1)) > nul 2>&1)
else
   nullerror = 2>/dev/null
   echo = $(if $(1),echo "$(1)")
   touch = $(if $(1),touch $(1))
   cpq = $(if $(1),cp $(1) $(2))
   cpv = cp $(1) $(2)
   rmq = $(if $(1),-rm -f $(1))
   rmrq = $(if $(1),-rm -f -r $(1))
   mkdirq = $(if $(1),-mkdir -p $(1))
   rmdirq = $(if $(1),-rmdir $(1))
endif

# potential common use variables
numbers := 0 1 2 3 4 5 6 7 8 9

# potential common use functions
reverselist = $(if $(1),$(call reverselist,$(strip $(wordlist 2,$(words $(1)),$(1))))) $(firstword $(1))
dirlistfromlocation = $(strip $(subst $(slash),$(space),$(subst $(backslash),$(space),$(1))))
spacenumbers = $(subst 0,$(space)0$(space),$(subst 1,$(space)1$(space),$(subst 2,$(space)2$(space),$(subst 3,$(space)3$(space),$(subst 4,$(space)4$(space),$(subst 5,$(space)5$(space),$(subst 6,$(space)6$(space),$(subst 7,$(space)7$(space),$(subst 8,$(space)8$(space),$(subst 9,$(space)9$(space),$(1)))))))))))
hasnumbers = $(if $(filter $(numbers),$(call spacenumbers,$(1))),$(1),)
isanumber = $(if $(filter-out $(numbers),$(call spacenumbers,$(1))),,$(1))

# location version utility functions (lv_*)
lv_issimplever = $(if $(call isanumber,$(firstword $(call spacenumbers,$(subst .,,$(1))))),$(1),)
lv_isversionver = $(if $(call lv_issimplever,$(1:v%=%)),$(1),$(if $(call lv_issimplever,$(1:ver%=%)),$(1),$(if $(call lv_issimplever,$(1:version%=%)),$(1),)))
lv_isreleasever = $(if $(call lv_issimplever,$(1:r%=%)),$(1),$(if $(call lv_issimplever,$(1:rel%=%)),$(1),$(if $(call lv_issimplever,$(1:release%=%)),$(1),)))
lv_isbuildver = $(if $(call lv_issimplever,$(1:b%=%)),$(1),$(if $(call lv_issimplever,$(1:bld%=%)),$(1),$(if $(call lv_issimplever,$(1:build%=%)),$(1),)))
lv_iscomplexver = $(if $(call lv_isversionver,$(1)),$(1),$(if $(call lv_isreleasever,$(1)),$(1),$(if $(call lv_isbuildver,$(1)),$(1),)))
lv_isver = $(if $(call lv_issimplever,$(1)),$(1),$(if $(call lv_iscomplexver,$(1)),$(1),))
lv_possibleverorver = $(if $(findstring -,$(1)),$(if $(call hasnumbers,$(1)),$(1),),$(if $(call lv_isver,$(1)),$(1),))
lv_termslistfromdir = $(strip $(subst -,$(space),$(1)))
lv_verfromtermlist = $(if $(1)$(2),$(if $(1),$(1)$(if $(2),-,),)$(call lv_verfromtermlist,$(firstword $(2)),$(wordlist 2,$(words $(2)),$(2))),)
lv_termwalker = $(if $(firstword $(1)),$(if $(call lv_isver,$(firstword $(1))),$(call lv_verfromtermlist,,$(1)),$(call lv_termwalker,$(wordlist 2,$(words $(1)),$(1)))),)
lv_version = $(if $(call lv_possibleverorver,$(1)),$(call lv_termwalker,$(call lv_termslistfromdir,$(1))),)
lv_dirwalker = $(if $(firstword $(1)),$(if $(call lv_version,$(firstword $(1))),$(call lv_version,$(firstword $(1))),$(call lv_dirwalker,$(wordlist 2,$(words $(1)),$(1)))),)
locationversion = $(call shwspace,$(call lv_dirwalker,$(call reverselist,$(subst $(space)$(space),$(space),$(call dirlistfromlocation,$(call hidspace,$(1)))))))

# SOURCE CODE REPOSITORY VERSION
ifndef REPOSITORY_VER
   # TODO: support other VCS
   ifndef GIT_REPOSITORY
      ifndef GIT
         GIT := git
      endif
      ifeq ($(shell $(GIT) --version $(nullerror)),)
         export GIT_NA := $(GIT)NotAvailable
      else
         ifneq ($(shell $(GIT) log -n 1 --format="%%%%" $(nullerror)),)
            export GIT_REPOSITORY := yes
            export REPOSITORY_VER := $(shell $(GIT) describe --tags --dirty=" (dirty)" --always)
         endif
      endif
   endif
   ifndef REPOSITORY_VER
      DIR_VER := $(call locationversion,$(CURDIR))
      ifneq ($(DIR_VER),)
         export REPOSITORY_VER := $(DIR_VER)
      endif
   endif
   ifndef REPOSITORY_VER
      export REPOSITORY_VER := unknown
   endif
endif

# COMPILER OPTIONS
ECSLIBOPT := $(if $(STATIC_LIBRARY_TARGET),-staticlib,$(if $(SHARED_LIBRARY_TARGET),-dynamiclib,))
FVISIBILITY := $(if $(WINDOWS_TARGET),,-fvisibility=hidden)
FPIC := $(if $(WINDOWS_TARGET),,-fPIC)
EXECUTABLE := $(if $(WINDOWS_TARGET),$(if $(EXECUTABLE_TARGET),$(CONSOLE),),)
INSTALLNAME := $(if $(OSX_TARGET),$(if $(SHARED_LIBRARY_TARGET),-install_name $(LP)$(MODULE)$(SO),),)

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
  _OPENSSL_CONF = $(call hidspace,$(call slash_path,$(OPENSSL_CONF)))
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
