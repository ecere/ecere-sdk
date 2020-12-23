empty :=
space := $(empty) $(empty)
str_is = $(if $(subst $2,,$1),,true)
single_goal = $(if $(word 2,$(MAKECMDGOALS)),,$(word 1,$(MAKECMDGOALS)))
single_goal_split = $(subst -,$(space),$1)
goals_is_single_print_target = $(if $(single_goal),$(if $(call str_is,$(word 1,$(single_goal_split)),print),$(if $(call str_is,$(word 2,$(single_goal_split)),var),true,$(if $(call str_is,$(word 2,$(single_goal_split)),substr),$(if $(call str_is,$(word 3,$(single_goal_split)),vars),true,),)),),)
ifneq ($(wildcard config.mk),)
ifeq ($(goals_is_single_print_target),)
$(info Using config.mk configuration file.)
endif
include config.mk
endif

CROSSPLATFORM_MK := defined

ifndef VERBOSE
MAKEFLAGS += --no-print-directory
endif

NOT_PARALLEL_TARGETS += clean realclean wipeclean distclean install

# HOST PLATFORM DETECTION
ifeq ($(OS),Windows_NT)
   HOST_PLATFORM := win32
   WINDOWS_HOST := defined
else
 _UNAME := $(shell uname)
 UNAME_P := $(shell uname -p)
 UNAME_M := $(shell uname -m)
 ifeq ($(_UNAME),FreeBSD)
 # Using Linux platform for Unix OSes for now
 #   HOST_PLATFORM := bsd
    BSD_HOST := defined
    HOST_PLATFORM := linux
    LINUX_HOST := defined
 else
  ifeq ($(_UNAME),Darwin)
     HOST_PLATFORM := apple
     OSX_HOST := defined
  else
     HOST_PLATFORM := linux
     LINUX_HOST := defined
  endif
 endif
 ifeq ($(UNAME_P),unknown)
  HOST_ARCH := $(UNAME_M)
 else
  HOST_ARCH := $(UNAME_P)
 endif
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
ifeq ($(TARGET_PLATFORM),win32)
   WINDOWS_TARGET := defined
else
ifeq ($(TARGET_PLATFORM),apple)
   OSX_TARGET := defined
else
#ifeq ($(TARGET_PLATFORM),bsd)
#   BSD_TARGET := defined
#else
   LINUX_TARGET := defined
#endif
endif
endif

# CROSS_TARGET
ifneq ($(TARGET_PLATFORM),$(HOST_PLATFORM))
   CROSS_TARGET := defined
endif

# TARGET_TYPE
ifeq ($(TARGET_TYPE),staticlib)
   STATIC_LIBRARY_TARGET := defined
else
ifeq ($(TARGET_TYPE),sharedlib)
   SHARED_LIBRARY_TARGET := defined
else
ifeq ($(TARGET_TYPE),executable)
   EXECUTABLE_TARGET := defined
endif
endif
endif

ifeq ($(GCC_PREFIX),i586-mingw32msvc-)
export ARCH
ARCH := x32
endif

ifeq ($(GCC_PREFIX),i686-w64-mingw32-)
export ARCH
ARCH := x32
endif

# Accept different things for ARCH but standardize on x32/x64
# This will be used for object directories
ifdef ARCH
 ifeq ($(ARCH),32)
  override ARCH := x32
 endif
 ifeq ($(ARCH),x86)
  override ARCH := x32
 endif
 ifeq ($(ARCH),i386)
  override ARCH := x32
 endif
 ifeq ($(ARCH),i686)
  override ARCH := x32
 endif
 ifeq ($(ARCH),64)
  override ARCH := x64
 endif
 ifeq ($(ARCH),amd64)
  override ARCH := x64
 endif
 ifeq ($(ARCH),x86_64)
  override ARCH := x64
 endif

 # Set ARCH_FLAGS only if ARCH is set
 ifeq ($(ARCH),x64)
  TARGET_ARCH := x86_64
  ARCH_FLAGS := -m64
 endif
 ifeq ($(ARCH),x32)
  TARGET_ARCH := i386
  ARCH_FLAGS := -m32
 endif

 ARCH_SUFFIX := .$(ARCH)

 ifdef LINUX_TARGET
  TARGET_TRIPLE := $(TARGET_ARCH)-linux-gnu
 endif

endif

# On Windows/32 bit systems, pass -m32 as TDM-GCC packaged with the installer produces 64 bit executables by default
# Disable this if your compiler does not accept -m32
ifndef ARCH
 ifeq ($(HOST_PLATFORM),win32)
  ifeq ($(TARGET_PLATFORM),win32)
   ifndef ProgramFiles(x86)
    ARCH := x32
    TARGET_ARCH := i386
    ARCH_FLAGS := -m32
   endif
  endif
 endif
endif

ifdef RENAME_B32
 ifeq ($(HOST_PLATFORM),$(TARGET_PLATFORM))
 # note: arch stuff is missing on windows
  ifeq ($(HOST_ARCH),x86_64)
   ifeq ($(TARGET_ARCH),i386)
	 B32_SFX := 32
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
ifneq ($(COMPILER),default)
COMPILER_SUFFIX = .$(COMPILER)$(ARCH_SUFFIX)
endif
endif

# STRING TOOLS
empty :=
esc := $(empty)$(empty)
space := $(empty) $(empty)
comma := ,
quote := "
slash := $(empty)/$(empty)
backslash := $(empty)\$(empty)
escspace = $(subst $(space),$(backslash)$(space),$(subst $(backslash)$(space),$(space),$(1)))
hidspace = $(subst $(space),$(esc),$(subst $(backslash)$(space),$(esc),$(1)))
shwspace = $(subst $(esc),$(backslash)$(space),$(1))
unescp_all = $(subst $(esc),$(backslash),$(subst $(backslash),,$(subst $(backslash)$(backslash),$(esc),$(1))))
path = $(call fp_encode,$(1))

# HIDDEN SPACE STRING TOOLS
temporaty_token := _+;:;+_:;+;:_:+;+:_
hidden_space := $(empty)$(empty)
hs_hide = $(subst $(space),$(hidden_space),$(1))
hs_unhide = $(subst $(hidden_space),$(space),$(1))
hs_escape = $(subst $(hidden_space),$(backslash)$(space),$(1))
hs_process = $(subst $(space),$(hidden_space),$(subst $(backslash)$(space),$(hidden_space),$(1)))
hs_quote_all = $(foreach item,$(1),"$(call hs_unhide,$(item))")
hs_quote_each = $(foreach item,$(1),$(if $(findstring $(esc),$(item)),"$(call hs_unhide,$(item))",$(item)))

# FILE PATH FUNCTIONS
fp_encode = $(call hidspace,$(call fp_unquote,$(1)))
fp_decode = $(call shwspace,$(1))
fp_unquote = $(subst $(quote),,$(1))
fp_opt_quotes = $(if $(findstring $(space),$(1)),"$(1)",$(1))
fp_no_parent_dir = $(foreach item,$(1),$(if $(findstring ..,$(item)),,$(item)))

# EACH PATH FUNCTIONS -- FILE PATH FUNCTIONS TO BE USED WITH FOREACH AND _PATH VARIABLE NAME
# i.e.: $(foreach _path,$(1),$(ep_wildcard))
ep_decode_syspath_quote = $(call fp_opt_quotes,$(call sys_path,$(call unescp_all,$(call fp_decode,$(_path)))))
ep_wildcard = $(if $(wildcard $(call fp_decode,$(_path))),$(_path),)
ep_unwildcard = $(if $(wildcard $(call fp_decode,$(_path))),,$(_path))

# PATH LISTS FUNCTIONS
pl_decode = $(foreach _path,$(1),$(ep_decode_syspath_quote))
pl_wildcard = $(foreach _path,$(1),$(ep_wildcard))
pl_unwildcard = $(foreach _path,$(1),$(ep_unwildcard))
pl_wildcard_some = $(if $(1),$(if $(subst $(space),,$(call pl_wildcard,$(1))),some,),)
pl_unwildcard_some = $(if $(1),$(if $(subst $(space),,$(call pl_unwildcard,$(1))),some,),)


# FILE SYSTEM TOOLS
# hs_ls doc
#     usage: $(hs_ls) | $(hs_ls_dir) | $(hs_ls_files)
#     result:
#      -      for hs_ls: a list of files and directories in the current dir
#                        i.e.: fileA dir1/ fileB fileC dir2/ dir3/
#      -  for hs_ls_dir: a list of directories in the current dir
#                        i.e.: dir1 dir2 dir3
#      - for hs_ls_file: a list of files in the current dir
#                        i.e.: fileA fileB fileC
#     notes:
#      - hs_ls* functions work in current dir, you can't specify a directory
#      - hs_ls* functions do not report hidden files and directories because wildcard doesn't
#        you would never get such a list: .fileA .dir1/
hs_ls = $(subst $(temporaty_token),$(space),$(subst ./,,$(call hs_hide,$(subst $(space)./,$(temporaty_token),$(wildcard ./*/)))))
hs_ls_dir = $(subst /,,$(foreach item,$(hs_ls),$(if $(findstring /,$(item)),$(item),)))
hs_ls_file = $(foreach item,$(hs_ls),$(if $(findstring /,$(item)),,$(item)))

# CONTROL FLOW TOOLS
# hs_crossloop usage: $(call hs_crossloop,<list>,<command_function>)
#                     hs_crossloop will call <command_function> with the item as first parameter ($(1))
hs_crossloop = $(call hs_unsafe_crossloop,$(call fp_no_parent_dir,$(1)),$(2))

# PATH SEPARATOR STRING TOOLS
ifdef WINDOWS_HOST
   ifneq ($(TERM),cygwin)
      ifndef MSYSCON
         WIN_PS_TOOLS := defined
      endif
   endif
endif
slash_path = $(subst $(backslash),$(slash),$(1))
ifdef WIN_PS_TOOLS
   psep := $(backslash)
   sys_path = $(subst $(backslash)$(backslash),$(slash),$(subst $(slash),$(backslash),$(1)))
   quote_path = "$(call sys_path,$(call unescp_all,$(1)))"
   each_path_quote = $(if $(findstring $(esc),$(_path)),"$(call unescp_all,$(call shwspace,$(_path)))",$(call unescp_all,$(_path)))
   sys_path_list = $(foreach _path,$(1),$(each_path_quote))
else
   psep := $(slash)
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

_MAKE = $(call fp_opt_quotes,$(MAKE))

# SHELL COMMANDS
ifdef WINDOWS_HOST
   ifneq ($(TERM),cygwin)
      ifndef MSYSCON
         WIN_SHELL_COMMANDS := defined
      endif
   endif
endif
ifdef V
   export V
endif
ifneq ($(V),1)
   SILENT_IS_ON := defined
endif
ifeq ($(D),1)
   DEBUG_IS_ON := defined
endif
addtolistfile = $(if $(1),@$(call echo,$(1))>> $(2),)
ifdef WIN_SHELL_COMMANDS
   cd = @cd
   nullerror = 2>NUL
   echo = $(if $(1),echo $(1))
   touch = $(if $(1),@cmd /c "for %%I in ($(call sys_path,$(1))) do @(cd %%~pI && type nul >> %%~nxI && copy /by %%~nxI+,, > nul 2>&1 && cd %%cd%%)")
   cp = $(if $(1),@cmd /c "for %%I in ($(call sys_path,$(1))) do copy /by %%I $(call sys_path,$(2))"$(if $(SILENT_IS_ON), > nul,))
   cpr = $(if $(1),xcopy /y /i /e$(if $(SILENT_IS_ON), /q,) $(call sys_path,$(call sys_path_list,$(1))) $(call sys_path,$(2))$(if $(SILENT_IS_ON), > nul,))
   rm = $(if $(call pl_wildcard_some,$(1)),-del /f$(if $(SILENT_IS_ON), /q,) $(call sys_path,$(call sys_path_list,$(call pl_wildcard,$(1))))$(if $(SILENT_IS_ON), > nul,),)
   rmr = $(if $(call pl_wildcard_some,$(1)),-rmdir /s /q $(call sys_path,$(call pl_wildcard,$(1)))$(if $(SILENT_IS_ON), > nul,),)
   mkdir = $(if $(call pl_unwildcard_some,$(1)),-mkdir $(call pl_decode,$(call pl_unwildcard,$(1)))$(if $(SILENT_IS_ON), > nul,),)
   rmdir = $(if $(call pl_wildcard_some,$(1)),-rmdir /q $(call pl_decode,$(call pl_wildcard,$(1)))$(if $(SILENT_IS_ON), > nul,),)
   hs_unsafe_crossloop = ${if $(1),${if $(2),@cmd /c "for %%I in (${call hs_quote_each,$(1)}) do ${call $(2),%%I}",},}
else
   cd = cd
   nullerror = 2>/dev/null
   echo = $(if $(1),echo "$(1)")
   touch = $(if $(1),touch $(1))
   cp = $(if $(1),cp -P$(if $(SILENT_IS_ON),,v) $(1) $(2))
   cpr = $(if $(1),cp -PR$(if $(SILENT_IS_ON),,v) $(1) $(2))
   rm = $(if $(call pl_wildcard_some,$(1)),-rm -f$(if $(SILENT_IS_ON),,v) $(call pl_wildcard,$(1)),)
   rmr = $(if $(call pl_wildcard_some,$(1)),-rm -fr$(if $(SILENT_IS_ON),,v) $(call pl_wildcard,$(1)),)
   mkdir = $(if $(call pl_unwildcard_some,$(1)),-mkdir -p$(if $(SILENT_IS_ON),,v) $(call pl_unwildcard,$(1)),)
   rmdir = $(if $(call pl_wildcard_some,$(1)),-rmdir$(if $(SILENT_IS_ON),, -v) $(call pl_wildcard,$(1)),)
   hs_unsafe_crossloop = ${if $(1),${if $(2),for item in ${call hs_quote_each,$(1)}; do ${call $(2),"$$item"}; done,},}
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
            export REPOSITORY_VER := $(shell $(GIT) describe --tags --dirty="-d" --always)
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
 ifdef OPENSSL_DIR
  OPENSSL_INCLUDE_DIR = $(if $(wildcard $(OPENSSL_DIR)/include),$(OPENSSL_DIR)/include,$(OPENSSL_DIR))
  OPENSSL_LIB_DIR = $(if $(wildcard $(OPENSSL_DIR)/lib),$(OPENSSL_DIR)/lib,$(OPENSSL_DIR))
  OPENSSL_BIN_DIR = $(if $(wildcard $(OPENSSL_DIR)/bin),$(OPENSSL_DIR)/bin,$(OPENSSL_DIR))
 else
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
endif

_example_space = $(space)$(space)$(space)
_mkcmd_example = $(space)$(space)$(space)$(MAKE_COMMAND)

NOT_PARALLEL_TARGETS += help
.PHONY: help
help:
	@$(info Ecere SDK Make Help)
	@$(info )
	@$(info help consists of command examples. try them!)
	@$(info )
	@$(info $(_mkcmd_example) help                                          -- this)
	@$(info $(_mkcmd_example) help-advanced                                 -- advanced build commands)
	@$(info $(_mkcmd_example) help-troubleshoot                             -- troubleshooting commands)
	@$(info )
	@$(info $(_mkcmd_example)                                               -- build ecere-sdk)
	@$(info $(_mkcmd_example) all                                           -- same)
	@$(info $(_mkcmd_example) -j1                                           -- build 1 step at a time)
	@$(info $(_mkcmd_example) -j8                                           -- build with 8 parallel jobs)
	@$(info $(_mkcmd_example) V=1                                           -- verbose build)
	@$(info $(_mkcmd_example) wipeclean all                                 -- fully rebuild)
	@$(info $(_mkcmd_example) ARCH=x32                                      -- build 32-bit binaries)
	@$(info $(_mkcmd_example) ENABLE_SSL=y                                  -- enable OpenSSL in Ecere library)
	@$(info $(_mkcmd_example) EDASQLite=y                                   -- build SQLite driver for EDA)
	@$(info $(_mkcmd_example) EDASQLiteCipher=y                             -- build SQLiteCipher driver for EDA)
	@$(info $(_mkcmd_example) EDAdBASE=y                                    -- build dBASE driver for EDA)
	@$(info $(_mkcmd_example) DISABLE_BINARY_COMPRESSION=y                  -- disable use of binary compression)
	@$(info )
	@$(info $(_mkcmd_example) ENABLE_SSL=y EDASQLite=y all -j9              -- common build)
	@$(info $(_mkcmd_example) ENABLE_SSL=y ARCH=x32 all -j9                 -- common 32-bit build)
	@$(info $(_mkcmd_example) ENABLE_SSL=y EDASQLite=y wipeclean all -j9    -- common full rebuild)
	@$(info $(_mkcmd_example) ENABLE_SSL=y ARCH=x32 wipeclean all -j9       -- common 32-bit full rebuild)
	@$(info )
	@$(info $(_mkcmd_example) clean                                         -- delete all intermediate object files)
	@$(info $(_mkcmd_example) realclean                                     -- remove all release intermediate object directories)
	@$(info $(_mkcmd_example) wipeclean                                     -- remove all intermediate object directories)
	@$(info )

NOT_PARALLEL_TARGETS += help-advanced
.PHONY: help-advanced
help-advanced:
	@$(info advanced commands:)
	@$(info )
	@$(info $(_mkcmd_example) distclean                                     -- remove all workspaces, generated makefiles and intermediate object directories)
	@$(info )
	@$(info $(_mkcmd_example) wipeclean all c_bindings cxx_bindings_gen     -- combine all these targets)
	@$(info )
	@$(info linux only commands:)
	@$(info )
	@$(info $(_example_space)time sh -c '$(MAKE_COMMAND) wipeclean all c_bindings cxx_bindings_gen -j9 && echo && make RENAME_B32=1 ARCH=x32 all -j9')
	@$(info )

NOT_PARALLEL_TARGETS += help-troubleshoot
.PHONY: help-troubleshoot
help-troubleshoot:
	@$(info troubleshooting commands:)
	@$(info )
	@$(info $(_mkcmd_example) troubleshoot                                  -- print the definition for all prepackaged list of variables)
	@$(info $(_mkcmd_example) troubleshoot-core                             -- print the definition for the core list of variables)
	@$(info $(_mkcmd_example) troubleshoot-toolchain                        -- print the definition for the toolchain list of variables)
	@$(info $(_mkcmd_example) troubleshoot-openssl                          -- print the definition for the openssl list of variables)
	@$(info $(_mkcmd_example) troubleshoot-version                          -- print the definition for the version list of variables)
	@$(info )
	@$(info $(_mkcmd_example) print-all-vars-info                           -- print the definition for all variables)
	@$(info $(_mkcmd_example) print-all-vars-stat                           -- print the definition, origin and flavor for all variables)
	@$(info $(_mkcmd_example) print-var-info-PLATFORM                       -- print the definition for the PLATFORM variable)
	@$(info $(_mkcmd_example) print-substr-vars-full-DIR                    -- print all information for all variables containing the DIR string)
	@$(info )
	@$(info available modes for print-var-<mode>-<name> and print-substr-vars-<mode>-<substring> targets:)
	@$(info $(_example_space)info (definition only)$(comma) eval (value only)$(comma) both (definition and value)$(comma))
	@$(info $(_example_space)stat (definition$(comma) origin and flavor) and full (definition$(comma) value$(comma) origin and flavor))
	@$(info )

var_info = $(if $(value $1),$1 = $(value $1),$1 is defined as an empty value)
var_eval = $(if $(value $1),$(if $($1),$1 = $($1),$1 evaluates to an empty value),$1 is defined as an empty value)
var_both = $(if $(value $1),$1 = $(value $1) $(if $($1),$(if $(call str_is,$($1),$(value $1)),(equal to definition),= $($1)),= (empty value)),$1 is defined as an empty value)
var_stat = $(call var_info,$1) [$(origin $1) $(flavor $1)]
var_full = $(call var_both,$1) [$(origin $1) $(flavor $1)]
info_var = $(info $(call $(if $2,$2,var_info),$1))
info_check_var_defined = $(info $(if $(subst $(space),,$(foreach var,$(.VARIABLES),$(if $(subst $1,,$(var)),,1))),$(call $(if $2,$2,var_info),$1),$1 is not defined))
info_all_vars = $(foreach var,$(sort $(.VARIABLES)),$(call info_var,$(var),$2))
info_all_substr_vars = $(foreach var,$(sort $(.VARIABLES)),$(if $(findstring $1,$(var)),$(call info_var,$(var),$2),))
msg_var_eval_crash = is not provided since evaluating variables that use control flow functions will crash

NOT_PARALLEL_TARGETS += print-all-vars-info print-all-vars-eval print-all-vars-both print-all-vars-stat print-all-vars-full
.PHONY: print-all-vars-info print-all-vars-eval print-all-vars-both print-all-vars-stat print-all-vars-full
print-all-vars-info: ; @$(call info_all_vars)
print-all-vars-eval: ; @$(info note: print-all-vars-eval $(msg_var_eval_crash))
print-all-vars-both: ; @$(info note: print-all-vars-both $(msg_var_eval_crash))
print-all-vars-stat: ; @$(if $(subst all,,$*),$(call info_check_var_defined,$*,var_stat),$(call info_all_vars,var_stat))
print-all-vars-full: ; @$(info note: print-all-vars-full $(msg_var_eval_crash))

NOT_PARALLEL_TARGETS += print-var-info-% print-var-eval-% print-var-both-% print-var-stat-% print-var-full-%
.PHONY: print-var-info-% print-var-eval-% print-var-both-% print-var-stat-% print-var-full-%
print-var-info-%: ; @$(call info_check_var_defined,$*)
print-var-eval-%: ; @$(call info_check_var_defined,$*,var_eval)
print-var-both-%: ; @$(call info_check_var_defined,$*,var_both)
print-var-stat-%: ; @$(call info_check_var_defined,$*,var_stat)
print-var-full-%: ; @$(call info_check_var_defined,$*,var_full)

NOT_PARALLEL_TARGETS += print-substr-vars-info-% print-substr-vars-eval-% print-substr-vars-both-% print-substr-vars-stat-% print-substr-vars-full-%
.PHONY: print-substr-vars-info-% print-substr-vars-eval-% print-substr-vars-both-% print-substr-vars-stat-% print-substr-vars-full-%
print-substr-vars-info-%: ; @$(call info_all_substr_vars,$*)
print-substr-vars-eval-%: ; @$(call info_all_substr_vars,$*,var_eval)
print-substr-vars-both-%: ; @$(call info_all_substr_vars,$*,var_both)
print-substr-vars-stat-%: ; @$(call info_all_substr_vars,$*,var_stat)
print-substr-vars-full-%: ; @$(call info_all_substr_vars,$*,var_full)

NOT_PARALLEL_TARGETS += troubleshoot
.PHONY: troubleshoot
troubleshoot: troubleshoot-core troubleshoot-toolchain troubleshoot-openssl troubleshoot-version

NOT_PARALLEL_TARGETS += troubleshoot-core
.PHONY: troubleshoot-core
troubleshoot-core:
	@$(info -- core variables --)
	@$(call info_check_var_defined,_CF_DIR,var_full)
	@$(call info_check_var_defined,WIN_SHELL_COMMANDS,var_full)
	@$(call info_check_var_defined,WIN_PS_TOOLS,var_full)
	@$(info -- important environtment variables --)
	@$(call info_check_var_defined,OS,var_full)
	@$(call info_check_var_defined,OSTYPE,var_full)
	@$(call info_check_var_defined,BASH,var_full)
	@$(call info_check_var_defined,TERM,var_full)
	@$(call info_check_var_defined,SHELL,var_full)
	@$(info -- host and target variables --)
	@$(call info_check_var_defined,HOST_PLATFORM,var_full)
	@$(call info_check_var_defined,TARGET_PLATFORM,var_full)
	@$(call info_check_var_defined,PLATFORM,var_full)
	@$(call info_check_var_defined,LINUX_HOST,var_full)
	@$(call info_check_var_defined,LINUX_TARGET,var_full)
	@$(call info_check_var_defined,OSX_HOST,var_full)
	@$(call info_check_var_defined,OSX_TARGET,var_full)
	@$(call info_check_var_defined,WINDOWS_HOST,var_full)
	@$(call info_check_var_defined,WINDOWS_TARGET,var_full)
	@$(call info_check_var_defined,BSD_HOST,var_full)
	@$(call info_check_var_defined,BSD_TARGET,var_full)
	@$(call info_check_var_defined,TARGET_ARCH,var_full)
	@$(info -- arch variables --)
	@$(call info_check_var_defined,ARCH,var_full)
	@$(call info_check_var_defined,ARCH_FLAGS,var_full)

NOT_PARALLEL_TARGETS += troubleshoot-toolchain
.PHONY: troubleshoot-toolchain
troubleshoot-toolchain:
	@$(info -- toolchain variables --)
	@$(call info_check_var_defined,GCC_PREFIX,var_full)
	@$(call info_check_var_defined,CC,var_full)
	@$(call info_check_var_defined,CPP,var_full)
	@$(call info_check_var_defined,ECP,var_full)
	@$(call info_check_var_defined,ECC,var_full)
	@$(call info_check_var_defined,ECS,var_full)
	@$(call info_check_var_defined,EAR,var_full)
	@$(call info_check_var_defined,AS,var_full)
	@$(call info_check_var_defined,LD,var_full)
	@$(call info_check_var_defined,AR,var_full)
	@$(call info_check_var_defined,STRIP,var_full)
	@$(info -- related variables --)
	@$(call info_check_var_defined,UPX,var_full)
	@$(call info_check_var_defined,CCACHE,var_full)
	@$(call info_check_var_defined,CCACHE_COMPILE,var_full)
	@$(call info_check_var_defined,CCACHE_PREFIX,var_full)
	@$(call info_check_var_defined,DISTCC,var_full)
	@$(info -- more related variables --)
	@$(call info_check_var_defined,DESTDIR,var_full)
	@$(call info_check_var_defined,PREFIXLIBDIR,var_full)
	@$(call info_check_var_defined,CPPFLAGS,var_full)
	@$(call info_check_var_defined,ROOT_ABSPATH,var_full)
	@$(call info_check_var_defined,DYLD_LIBRARY_PATH,var_full)

NOT_PARALLEL_TARGETS += troubleshoot-openssl
.PHONY: troubleshoot-openssl
troubleshoot-openssl:
	@$(info -- toolchain variables --)
	@$(call info_check_var_defined,OPENSSL_CONF,var_full)
	@$(call info_check_var_defined,OPENSSL_INCLUDE_DIR,var_full)
	@$(call info_check_var_defined,OPENSSL_LIB_DIR,var_full)
	@$(call info_check_var_defined,OPENSSL_BIN_DIR,var_full)

NOT_PARALLEL_TARGETS += troubleshoot-version
.PHONY: troubleshoot-version
troubleshoot-version:
	@$(info -- version variables --)
	@$(call info_check_var_defined,GIT_REPOSITORY,var_full)
	@$(call info_check_var_defined,DIR_VER,var_full)
	@$(call info_check_var_defined,REPOSITORY_VER,var_full)

.DEFAULT_GOAL =
