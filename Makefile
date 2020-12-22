ifneq ($(V),1)
.SILENT:
endif

.PHONY: all clean realclean wipeclean distclean emptyoutput prepinstall actualinstall install copyonlyinstall uninstall troubleshoot outputdirs bootstrap deps ecere ecerecom ecerevanilla ear compiler prepbinaries epj2make libec2 bgen ide documentor eda prepcodeguard codeguard fixprecompile cleantarget pots installer regenbootstrap updatebootstrap update_ecere update_libec update_ecp update_ecc update_ecs ecereaudio

ROOT_ABSPATH := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
_CF_DIR = $(ROOT_ABSPATH)

include crossplatform.mk
include default.cf

.NOTPARALLEL: $(NOT_PARALLEL_TARGETS)

ifdef BSD_HOST
INSTALL_FLAGS :=
CPFLAGS := -pRf
else
INSTALL_FLAGS := -D
CPFLAGS := -dpRf
endif

XBOOT := $(if $(CROSS_TARGET),GCC_PREFIX= TARGET_PLATFORM=$(HOST_PLATFORM) PLATFORM=$(HOST_PLATFORM),)

LIBVER := .0.44

ifndef ECERE_AUDIO
ECERE_AUDIO := n

ifdef WINDOWS_TARGET
ECERE_AUDIO := y
endif

ifdef LINUX_TARGET
ifndef BSD_TARGET
ECERE_AUDIO := y
endif
endif
endif

ifndef DISABLE_EDA_SQLITE
  EDASQLite := defined
endif
ifndef DISABLE_EDA_dBASE
  EDAdBASE := defined
endif

ifdef WINDOWS_HOST
HOST_SOV := $(HOST_SO)
else
HOST_SOV := $(HOST_SO)$(LIBVER)
endif

ifdef WINDOWS_TARGET

SOV := $(SO)

ifndef DESTDIR

ifndef ECERE_SDK_INSTALL_DIR

ifeq ($(TARGET_ARCH),x86_64)
   ifneq ($(wildcard $(SystemDrive)/Program\ Files ),)
      export DESTDIR=$(SystemDrive)/Program Files/Ecere SDK
   else
      export DESTDIR=$(SystemDrive)/Ecere SDK
   endif
else
   ifdef ProgramFiles(x86)
      export DESTDIR=${ProgramFiles(x86)}/Ecere SDK
   else
      ifdef ProgramFiles
         export DESTDIR=$(ProgramFiles)/Ecere SDK
      else
         export DESTDIR=$(SystemDrive)/Ecere SDK
      endif
   endif
endif

else
	export DESTDIR=$(ECERE_SDK_INSTALL_DIR)
endif # ECERE_SDK_INSTALL_DIR

endif # DESTDIR

export prefix=

ifndef DOCDIR
export DOCDIR=$(DESTDIR)$(prefix)/doc
endif

ifndef BINDIR
export BINDIR=$(DESTDIR)$(prefix)/bin
endif

ifndef LIBDIR
export LIBDIR=$(BINDIR)
endif
export DESTLIBDIR=$(LIBDIR)

ifndef SLIBDIR
export SLIBDIR=$(DESTDIR)$(prefix)/lib
endif
export DESTSLIBDIR=$(SLIBDIR)

ifndef SAMPLESDIR
export SAMPLESDIR=$(DESTDIR)$(prefix)/samples
endif

ifndef EXTRASDIR
export EXTRASDIR=$(DESTDIR)$(prefix)/extras
endif


else # WINDOWS_TARGET

ifdef OSX_TARGET
# TODO: OSX soname
SOV := $(SO)
else
SOV := $(SO)$(LIBVER)
endif

ifndef DESTDIR
export DESTDIR=
endif

ifndef prefix
export prefix=/usr
endif

ifndef DOCDIR
export DOCDIR=$(DESTDIR)$(prefix)/share/ecere/doc
endif

ifndef MANDIR
export MANDIR=$(DESTDIR)$(prefix)/share/man
endif

ifndef BINDIR
export BINDIR=$(DESTDIR)$(prefix)/bin
endif

ifdef LIBDIR
 export PREFIXLIBDIR=$(LIBDIR)
else
 export PREFIXLIBDIR=$(prefix)/lib/$(TARGET_ARCH)

 ifeq ($(wildcard $(prefix)/lib/$(TARGET_ARCH) ),)
  export PREFIXLIBDIR=$(prefix)/lib

  ifeq ($(TARGET_ARCH),i386-linux-gnu)
   ifneq ($(wildcard $(prefix)/lib32 ),)
    export PREFIXLIBDIR=$(prefix)/lib32
   endif
  endif

 endif
endif

export CPPFLAGS
CPPFLAGS += -DDEB_HOST_MULTIARCH=\"$(call escspace,$(PREFIXLIBDIR))\"

DESTLIBDIR := $(DESTDIR)$(PREFIXLIBDIR)
ifdef SLIBDIR
DESTSLIBDIR := $(DESTDIR)$(SLIBDIR)
else
DESTSLIBDIR := $(DESTLIBDIR)
endif

ifndef SAMPLESDIR
export SAMPLESDIR=$(DESTDIR)$(prefix)/share/ecere/samples
endif

ifndef EXTRASDIR
export EXTRASDIR=$(DESTDIR)$(prefix)/share/ecere/extras
endif


endif

OBJDIR := obj$(OBJALT)/
OBJBINDIR := $(OBJDIR)$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/bin/
OBJLIBDIR := $(OBJDIR)$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/lib/
XOBJDIR := obj$(OBJALT)/
XOBJBINDIR := $(OBJDIR)$(HOST_PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/bin/
XOBJLIBDIR := $(OBJDIR)$(HOST_PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/lib/

ifdef WINDOWS_TARGET
OBJSODIR := $(OBJBINDIR)
XOBJSODIR := $(XOBJBINDIR)
else
OBJSODIR := $(OBJLIBDIR)
XOBJSODIR := $(XOBJBINDIR)
endif

all: prepbinaries bgen
ifndef ECERE_PYTHON_PACKAGE
all: epj2make ide documentor
endif
all: eda codeguard ecereaudio
	@$(call echo,The Ecere SDK is fully built.)

include Makefile.bindings

outputdirs:
	$(call mkdir,$(OBJDIR))
	$(call mkdir,$(OBJBINDIR))
	$(call mkdir,$(OBJLIBDIR))
ifdef CROSS_TARGET
	$(call mkdir,$(XOBJDIR))
	$(call mkdir,$(XOBJBINDIR))
	$(call mkdir,$(XOBJLIBDIR))
endif

bootstrap: outputdirs
ifdef CI
	@$(call echo,$(CC))
	@$(CC) --version
endif
	+cd compiler && $(_MAKE) $(XBOOT) bootstrap

deps:
ifdef CROSS_TARGET
ifndef LINUX_HOST
	@$(call echo,Building dependencies (host)...)
	+cd deps && $(_MAKE) $(XBOOT)
endif
endif
ifndef LINUX_TARGET
	@$(call echo,Building dependencies...)
	+cd deps && $(_MAKE)
endif

ecere: bootstrap deps
ifdef CROSS_TARGET
	@$(call echo,Building 2nd stage ecere (host)...)
else
	@$(call echo,Building 2nd stage ecere...)
endif
	+cd ecere && $(_MAKE) nores $(XBOOT)
	+cd ear && $(_MAKE) nores $(XBOOT)
	+cd ecere && $(_MAKE) cleaneceretarget
ifdef CROSS_TARGET
	@$(call echo,Building 2nd stage ecere...)
endif
	+cd ecere && $(_MAKE)

ecerecom: bootstrap
ifdef CROSS_TARGET
	@$(call echo,Building eC Core Runtime (host)...)
	+cd ecere && $(_MAKE) -f Makefile.ecereCOM $(XBOOT)
endif
	@$(call echo,Building eC Core Runtime...)
	+cd ecere && $(_MAKE) -f Makefile.ecereCOM

ecerevanilla: bootstrap
	@$(call echo,Building Vanilla Ecere...)
	+cd ecere && $(_MAKE) -f Makefile.vanilla

ear: ecere ecerevanilla
	@$(call echo,Building ear...)
	+cd ear && cd cmd && $(_MAKE) cleantarget
	+cd ear && $(_MAKE)

fixprecompile:
	+cd compiler && $(_MAKE) fixprecompile

compiler: ecere ear
ifdef CROSS_TARGET
	@$(call echo,Building 2nd stage compiler (host))
	+cd compiler && $(_MAKE) $(XBOOT)
endif
	@$(call echo,Building 2nd stage compiler)
	+cd compiler && $(_MAKE)

prepbinaries: compiler libec2 ecerecom
	@$(call echo,Enabling 2nd stage binaries...)
	$(call cp,ecere/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ecere$(SOV),$(OBJSODIR))
	$(call cp,ecere/obj/ecereCOM.release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ecereCOM$(SOV),$(OBJSODIR))
	$(call cp,compiler/libec/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ec$(SOV),$(OBJSODIR))
	$(call cp,compiler/libec2/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ec2$(SOV),$(OBJSODIR))
ifdef LINUX_TARGET
	ln -sf $(LP)ecere$(SOV) $(OBJLIBDIR)$(LP)ecere$(SO).0
	ln -sf $(LP)ecereCOM$(SOV) $(OBJLIBDIR)$(LP)ecereCOM$(SO).0
	ln -sf $(LP)ec$(SOV) $(OBJLIBDIR)$(LP)ec$(SO).0
	ln -sf $(LP)ec2$(SOV) $(OBJLIBDIR)$(LP)ec2$(SO).0
	ln -sf $(LP)ecere$(SOV) $(OBJLIBDIR)$(LP)ecere$(SO)
	ln -sf $(LP)ecereCOM$(SOV) $(OBJLIBDIR)$(LP)ecereCOM$(SO)
	ln -sf $(LP)ec$(SOV) $(OBJLIBDIR)$(LP)ec$(SO)
	ln -sf $(LP)ec2$(SOV) $(OBJLIBDIR)$(LP)ec2$(SO)
endif
	$(call cp,ear/cmd/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ear$(B32_SFX)$(E),$(OBJBINDIR))
	$(call cp,compiler/ecc/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecc$(B32_SFX)$(E),$(OBJBINDIR))
	$(call cp,compiler/ecp/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecp$(B32_SFX)$(E),$(OBJBINDIR))
	$(call cp,compiler/ecs/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecs$(B32_SFX)$(E),$(OBJBINDIR))

ifdef CROSS_TARGET

	$(call cp,ecere/obj/release.$(HOST_PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(HOST_LP)ecere$(HOST_SOV),$(XOBJSODIR))
	$(call cp,ecere/obj/ecereCOM.release.$(HOST_PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(HOST_LP)ecereCOM$(HOST_SOV),$(XOBJSODIR))
	$(call cp,compiler/libec/obj/release.$(HOST_PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(HOST_LP)ec$(HOST_SOV),$(XOBJSODIR))
	$(call cp,compiler/libec2/obj/release.$(HOST_PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(HOST_LP)ec2$(HOST_SOV),$(XOBJSODIR))
ifdef LINUX_HOST
	ln -sf $(HOST_LP)ecere$(HOST_SOV) $(XOBJLIBDIR)$(LP)ecere$(HOST_SO).0
	ln -sf $(HOST_LP)ecereCOM$(HOST_SOV) $(XOBJLIBDIR)$(LP)ecereCOM$(HOST_SO).0
	ln -sf $(HOST_LP)ec$(HOST_SOV) $(XOBJLIBDIR)$(LP)ec$(HOST_SO).0
	ln -sf $(HOST_LP)ec2$(HOST_SOV) $(XOBJLIBDIR)$(LP)ec2$(HOST_SO).0
	ln -sf $(HOST_LP)ecere$(HOST_SOV) $(XOBJLIBDIR)$(LP)ecere$(HOST_SO)
	ln -sf $(HOST_LP)ecereCOM$(HOST_SOV) $(XOBJLIBDIR)$(LP)ecereCOM$(HOST_SO)
	ln -sf $(HOST_LP)ec$(HOST_SOV) $(XOBJLIBDIR)$(LP)ec$(HOST_SO)
	ln -sf $(HOST_LP)ec2$(HOST_SOV) $(XOBJLIBDIR)$(LP)ec2$(HOST_SO)
endif
	$(call cp,ear/cmd/obj/release.$(HOST_PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ear$(HOST_E),$(XOBJBINDIR))
	$(call cp,compiler/ecc/obj/release.$(HOST_PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecc$(HOST_E),$(XOBJBINDIR))
	$(call cp,compiler/ecp/obj/release.$(HOST_PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecp$(HOST_E),$(XOBJBINDIR))
	$(call cp,compiler/ecs/obj/release.$(HOST_PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecs$(HOST_E),$(XOBJBINDIR))

endif

epj2make: prepbinaries
	@$(call echo,Building epj2make...)
	+cd epj2make && $(_MAKE)

libec2: compiler
	@$(call echo,Building libec2...)
	+cd compiler/libec2 && $(_MAKE)

bgen: prepbinaries
	@$(call echo,Building bgen...)
	+cd bgen && $(_MAKE)

ecereaudio: prepbinaries
ifneq ($(ECERE_AUDIO),n)
	@$(call echo,Building EcereAudio...)
	+cd audio && $(_MAKE)
endif

ide: prepbinaries
	@$(call echo,Building IDE...)
	+cd ide && $(_MAKE)

documentor: prepbinaries
	@$(call echo,Building Documentor...)
	+cd documentor && $(_MAKE)

codeguard: prepcodeguard
ifdef CodeGuard
	@$(call echo,Building CodeGuard client...)
	+cd codeGuard && $(_MAKE)
endif

prepcodeguard: eda
ifdef CodeGuard
ifdef WINDOWS_TARGET
	$(call cp,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SO),$(OBJBINDIR))
endif

ifdef LINUX_TARGET
	$(call cp,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SOV),$(OBJLIBDIR))
	ln -sf $(LP)EDA$(SOV) $(OBJLIBDIR)$(LP)EDA$(SO).0
	ln -sf $(LP)EDA$(SOV) $(OBJLIBDIR)$(LP)EDA$(SO)
endif

ifndef WINDOWS_TARGET
ifndef LINUX_TARGET
	$(call cp,eda/libeda/obj/release.$(PLATFORM)/$(LP)EDA$(SO),$(OBJLIBDIR))
endif
endif
endif

eda: prepbinaries
ifdef CROSS_TARGET
	@$(call echo,Building EDA (host))
	+cd eda && $(_MAKE) $(XBOOT)
endif
	@$(call echo,Building EDA...)
	+cd eda && $(_MAKE)

emptyoutput: outputdirs
	$(call rm,$(OBJLIBDIR)libecereVanilla$(A))
	$(call rm,$(SODESTDIR)$(LP)ecere$(SO))
	$(call rm,$(SODESTDIR)$(LP)ecereCOM$(SO))
	$(call rm,$(SODESTDIR)$(LP)ec$(SO))
	$(call rm,$(SODESTDIR)$(LP)EDA$(SO))
ifdef EDAdBASE
	$(call rm,$(SODESTDIR)$(LP)EDAdBASE$(SO))
endif
ifdef EDASQLite
	$(call rm,$(SODESTDIR)$(LP)EDASQLite$(SO))
endif
ifdef EDASQLiteCipher
	$(call rm,$(SODESTDIR)$(LP)EDASQLiteCipher$(SO))
endif
ifneq ($(ECERE_AUDIO),n)
	$(call rm,$(SODESTDIR)$(LP)EcereAudio$(SO))
endif
ifdef LINUX_TARGET
	$(call rm,$(SODESTDIR)$(LP)ecere$(SO).0)
	$(call rm,$(SODESTDIR)$(LP)ecereCOM$(SO).0)
	$(call rm,$(SODESTDIR)$(LP)ec$(SO).0)
	$(call rm,$(SODESTDIR)$(LP)EDA$(SO).0)
ifdef EDAdBASE
	$(call rm,$(SODESTDIR)$(LP)EDAdBASE$(SO).0)
endif
ifdef EDASQLite
	$(call rm,$(SODESTDIR)$(LP)EDASQLite$(SO).0)
endif
ifdef EDASQLiteCipher
	$(call rm,$(SODESTDIR)$(LP)EDASQLiteCipher$(SO).0)
endif
ifneq ($(ECERE_AUDIO),n)
	$(call rm,$(SODESTDIR)$(LP)EcereAudio$(SO).0)
endif
	$(call rm,$(SODESTDIR)$(LP)ecere$(SOV))
	$(call rm,$(SODESTDIR)$(LP)ecereCOM$(SOV))
	$(call rm,$(SODESTDIR)$(LP)ec$(SOV))
	$(call rm,$(SODESTDIR)$(LP)ec2$(SOV))
	$(call rm,$(SODESTDIR)$(LP)EDA$(SOV))
ifdef EDAdBASE
	$(call rm,$(SODESTDIR)$(LP)EDAdBASE$(SOV))
endif
ifdef EDASQLite
	$(call rm,$(SODESTDIR)$(LP)EDASQLite$(SOV))
endif
ifdef EDASQLiteCipher
	$(call rm,$(SODESTDIR)$(LP)EDASQLiteCipher$(SOV))
endif
ifneq ($(ECERE_AUDIO),n)
	$(call rm,$(SODESTDIR)$(LP)EcereAudio$(SOV))
endif
endif	
	$(call rm,$(OBJBINDIR)ear$(B32_SFX)$(E))
	$(call rm,$(OBJBINDIR)ecc$(B32_SFX)$(E))
	$(call rm,$(OBJBINDIR)ecp$(B32_SFX)$(E))
	$(call rm,$(OBJBINDIR)ecs$(B32_SFX)$(E))
	$(call rm,$(OBJBINDIR)epj2make$(E))
	$(call rm,$(OBJBINDIR)bgen$(E))
	$(call rm,$(OBJBINDIR)ecere-ide$(E))
	$(call rm,$(OBJBINDIR)documentor$(E))
ifdef CodeGuard
	$(call rm,$(OBJBINDIR)CodeGuard$(E))
endif

cleantarget:
	+cd compiler && $(_MAKE) cleantarget
	+cd documentor && $(_MAKE) cleantarget
	+cd ear && $(_MAKE) cleantarget
	+cd ecere && $(_MAKE) cleantarget
	+cd eda && $(_MAKE) cleantarget
	+cd epj2make && $(_MAKE) cleantarget
	+cd compiler/libec2 && $(_MAKE) cleantarget
	+cd bgen && $(_MAKE) cleantarget
	+cd ide && $(_MAKE) cleantarget
	+cd installer && $(_MAKE) cleantarget
ifneq ($(ECERE_AUDIO),n)
	+cd audio && $(_MAKE) cleantarget
endif

pots: cleantarget
	$(_MAKE) OUTPUT_POT=1
	+cd installer && $(_MAKE) OUTPUT_POT=1 pots

ifdef WINDOWS_TARGET
installer:
	$(_MAKE) prepinstall ARCH=
	$(_MAKE) prepinstall ARCH=x32
	@$(call echo,Building Ecere runtime for installer...)
	+cd ecere && @$(_MAKE) -f Makefile.installer ARCH=x32
	@$(call echo,Building Installer for Windows...)
	+cd installer && @$(_MAKE) ARCH=x32
	@$(call echo,The Ecere SDK Windows Installer is fully built.)
endif

clean: emptyoutput bindings_clean
ifndef LINUX_TARGET
	+cd deps && $(_MAKE) clean
endif
	+cd ecere && $(_MAKE) clean
	+cd compiler && $(_MAKE) clean
	+cd ear && $(_MAKE) clean
	+cd epj2make && $(_MAKE) clean
	+cd compiler/libec2 && $(_MAKE) clean
	+cd bgen && $(_MAKE) clean
	+cd ide && $(_MAKE) clean
	+cd documentor && $(_MAKE) clean
ifneq ($(ECERE_AUDIO),n)
	+cd audio && $(_MAKE) clean
endif
ifdef CodeGuard
	+cd codeGuard && $(_MAKE) clean
endif
	+cd eda && $(_MAKE) clean
	@$(call echo,Done.)

realclean: bindings_realclean
ifndef LINUX_TARGET
	+cd deps && $(_MAKE) realclean
endif
	+cd ecere && $(_MAKE) realclean
	+cd compiler && $(_MAKE) realclean
	+cd ear && $(_MAKE) realclean
	+cd epj2make && $(_MAKE) realclean
	+cd compiler/libec2 && $(_MAKE) realclean
	+cd bgen && $(_MAKE) realclean
	+cd ide && $(_MAKE) realclean
	+cd documentor && $(_MAKE) realclean
ifneq ($(ECERE_AUDIO),n)
	+cd audio && $(_MAKE) realclean
endif
ifdef CodeGuard
	+cd codeGuard && $(_MAKE) realclean
endif
	+cd eda && $(_MAKE) realclean
	$(call rmr,obj/$(PLATFORM)/)
	@$(call echo,Done.)

wipeclean: bindings_wipeclean
	$(call rmr,obj/)
	+cd deps && $(_MAKE) wipeclean
	+cd ecere && $(_MAKE) wipeclean
	+cd compiler && $(_MAKE) wipeclean
	+cd ear && $(_MAKE) wipeclean
	+cd epj2make && $(_MAKE) wipeclean
	+cd compiler/libec2 && $(_MAKE) wipeclean
	+cd bgen && $(_MAKE) wipeclean
	+cd ide && $(_MAKE) wipeclean
	+cd documentor && $(_MAKE) wipeclean
	+cd audio && $(_MAKE) wipeclean
	+cd eda && $(_MAKE) wipeclean
	@$(call echo,Done.)

distclean: bindings_distclean
	$(_MAKE) -f Cleanfile distclean distclean_all_subdirs
	@$(call echo,Done.)

DOC = doc

$(MAKEFILE_LIST): ;
$(SOURCES): ;
$(RESOURCES): ;

BINARIES = \
	ecere/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ecere$(SOV) \
	ecere/obj/ecereCOM.release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ecereCOM$(SOV) \
	ecere/obj/vanilla.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/libecereVanilla$(A) \
	compiler/libec/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ec$(SOV) \
	compiler/libec2/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ec2$(SOV) \
	compiler/ecp/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecp$(B32_SFX)$(E) \
	compiler/ecc/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecc$(B32_SFX)$(E) \
	compiler/ecs/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecs$(B32_SFX)$(E) \
	ear/cmd/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ear$(B32_SFX)$(E) \
	bgen/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/bgen$(E) \
	eda/libeda/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDA$(SOV)

ifdef EDAdBASE
BINARIES += eda/drivers/dbase/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDAdBASE$(SOV)
endif
ifdef EDASQLite
BINARIES += \
	eda/drivers/sqlite/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDASQLite$(SOV)
endif

ifndef ECERE_PYTHON_PACKAGE
BINARIES += \
	epj2make/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/epj2make$(E) \
	documentor/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/documentor$(E) \
	ide/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecere-ide$(E)
endif

ifneq ($(ECERE_AUDIO),n)
BINARIES += audio/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EcereAudio$(SOV)
endif

ifdef CodeGuard
BINARIES += codeGuard/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/CodeGuard$(E)
endif

ifdef EDASQLiteCipher
BINARIES += eda/drivers/sqliteCipher/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDASQLiteCipher$(SOV)
endif

OBJPYDIR := $(OBJDIR)$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/py

.PHONY: py_prepinstall
py_prepinstall: prepinstall
	$(call mkdir,$(call path,$(OBJPYDIR)/))
	$(call cp,$(OBJLIBDIR)$(LP)ecereCOM$(SOV),$(OBJPYDIR)/$(LP)ecereCOM$(SO).0)
	$(call cp,$(OBJLIBDIR)$(LP)ecere$(SOV),$(OBJPYDIR)/$(LP)ecere$(SO).0)
	$(call cp,$(OBJLIBDIR)$(LP)EDA$(SOV),$(OBJPYDIR)/$(LP)EDA$(SO).0)

# Making sure everything is in $(OBJBINDIR) and $(OBJLIBDIR)
# Shared Libraries (in $(OBJBINDIR) on Windows and $(OBJLIBDIR) otherwise)
# Symlinks for libs on Linux
# Binaries (always in $(OBJBINDIR)) and Static Libraries (always in $(OBJLIBDIR))
prepinstall: $(DOC) $(BINARIES) outputdirs

ifdef WINDOWS_TARGET
	$(call cp,ecere/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ecere$(SO),$(OBJBINDIR))
	$(call cp,ecere/obj/ecereCOM.release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ecereCOM$(SO),$(OBJBINDIR))
	$(call cp,compiler/libec/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ec$(SO),$(OBJBINDIR))
	$(call cp,compiler/libec2/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ec2$(SO),$(OBJBINDIR))
	$(call cp,eda/libeda/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDA$(SO),$(OBJBINDIR))
ifdef EDAdBASE
	$(call cp,eda/drivers/dbase/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDAdBASE$(SO),$(OBJBINDIR))
endif
ifdef EDASQLite
	$(call cp,eda/drivers/sqlite/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDASQLite$(SO),$(OBJBINDIR))
endif
ifneq ($(ECERE_AUDIO),n)
	$(call cp,audio/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EcereAudio$(SO),$(OBJBINDIR))
endif
ifdef EDASQLiteCipher
	$(call cp,eda/drivers/sqliteCipher/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDASQLiteCipher$(SO),$(OBJBINDIR))
endif
endif

ifdef LINUX_TARGET
	$(call cp,ecere/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ecere$(SOV),$(OBJLIBDIR))
	$(call cp,ecere/obj/ecereCOM.release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ecereCOM$(SOV),$(OBJLIBDIR))
	$(call cp,compiler/libec/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ec$(SOV),$(OBJLIBDIR))
	$(call cp,compiler/libec2/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ec2$(SOV),$(OBJLIBDIR))
	$(call cp,eda/libeda/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDA$(SOV),$(OBJLIBDIR))
ifdef EDAdBASE
	$(call cp,eda/drivers/dbase/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDAdBASE$(SOV),$(OBJLIBDIR))
endif
ifdef EDASQLite
	$(call cp,eda/drivers/sqlite/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDASQLite$(SOV),$(OBJLIBDIR))
endif
ifneq ($(ECERE_AUDIO),n)
	$(call cp,audio/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EcereAudio$(SOV),$(OBJLIBDIR))
endif
ifdef EDASQLiteCipher
	$(call cp,eda/drivers/sqliteCipher/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDASQLiteCipher$(SOV),$(OBJLIBDIR))
endif
	ln -sf $(LP)ecere$(SOV) $(OBJLIBDIR)$(LP)ecere$(SO).0
	ln -sf $(LP)ecereCOM$(SOV) $(OBJLIBDIR)$(LP)ecereCOM$(SO).0
	ln -sf $(LP)ec$(SOV) $(OBJLIBDIR)$(LP)ec$(SO).0
	ln -sf $(LP)ec2$(SOV) $(OBJLIBDIR)$(LP)ec2$(SO).0
	ln -sf $(LP)EDA$(SOV) $(OBJLIBDIR)$(LP)EDA$(SO).0
ifdef EDAdBASE
	ln -sf $(LP)EDAdBASE$(SOV) $(OBJLIBDIR)$(LP)EDAdBASE$(SO).0
endif
ifdef EDASQLite
	ln -sf $(LP)EDASQLite$(SOV) $(OBJLIBDIR)$(LP)EDASQLite$(SO).0
endif
ifdef EDASQLiteCipher
	ln -sf $(LP)EDASQLiteCipher$(SOV) $(OBJLIBDIR)$(LP)EDASQLiteCipher$(SO).0
endif
ifneq ($(ECERE_AUDIO),n)
	ln -sf $(LP)EcereAudio$(SOV) $(OBJLIBDIR)$(LP)EcereAudio$(SO).0
endif

	ln -sf $(LP)ecere$(SOV) $(OBJLIBDIR)$(LP)ecere$(SO)
	ln -sf $(LP)ecereCOM$(SOV) $(OBJLIBDIR)$(LP)ecereCOM$(SO)
	ln -sf $(LP)ec$(SOV) $(OBJLIBDIR)$(LP)ec$(SO)
	ln -sf $(LP)ec2$(SOV) $(OBJLIBDIR)$(LP)ec2$(SO)
	ln -sf $(LP)EDA$(SOV) $(OBJLIBDIR)$(LP)EDA$(SO)
ifdef EDAdBASE
	ln -sf $(LP)EDAdBASE$(SOV) $(OBJLIBDIR)$(LP)EDAdBASE$(SO)
endif
ifdef EDASQLite
	ln -sf $(LP)EDASQLite$(SOV) $(OBJLIBDIR)$(LP)EDASQLite$(SO)
endif
ifdef EDASQLiteCipher
	ln -sf $(LP)EDASQLiteCipher$(SOV) $(OBJLIBDIR)$(LP)EDASQLiteCipher$(SO)
endif
	ln -sf $(LP)EcereAudio$(SOV) $(OBJLIBDIR)$(LP)EcereAudio$(SO)
endif

ifndef WINDOWS_TARGET
ifndef LINUX_TARGET
	$(call cp,ecere/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ecere$(SO),$(OBJLIBDIR))
	$(call cp,ecere/obj/ecereCOM.release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ecereCOM$(SO),$(OBJLIBDIR))
	$(call cp,compiler/libec/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ec$(SO),$(OBJLIBDIR))
	$(call cp,compiler/libec2/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)ec2$(SO),$(OBJLIBDIR))
	$(call cp,eda/libeda/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDA$(SO),$(OBJLIBDIR))
ifdef EDAdBASE
	$(call cp,eda/drivers/dbase/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDAdBASE$(SO),$(OBJLIBDIR))
endif
ifdef EDASQLite
	$(call cp,eda/drivers/sqlite/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDASQLite$(SO),$(OBJLIBDIR))
endif
ifneq ($(ECERE_AUDIO),n)
	$(call cp,audio/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EcereAudio$(SO),$(OBJLIBDIR))
endif
ifdef EDASQLiteCipher
	$(call cp,eda/drivers/sqliteCipher/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)EDASQLiteCipher$(SO),$(OBJLIBDIR))
endif
endif
endif

	$(call cp,ear/cmd/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ear$(B32_SFX)$(E),$(OBJBINDIR))
	$(call cp,compiler/ecc/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecc$(B32_SFX)$(E),$(OBJBINDIR))
	$(call cp,compiler/ecp/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecp$(B32_SFX)$(E),$(OBJBINDIR))
	$(call cp,compiler/ecs/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecs$(B32_SFX)$(E),$(OBJBINDIR))
	$(call cp,bgen/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/bgen$(E),$(OBJBINDIR))
ifndef ECERE_PYTHON_PACKAGE
	$(call cp,ide/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/ecere-ide$(E),$(OBJBINDIR))
	$(call cp,epj2make/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/epj2make$(E),$(OBJBINDIR))
	$(call cp,documentor/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/documentor$(E),$(OBJBINDIR))
endif
ifdef CodeGuard
	$(call cp,codeGuard/obj/release.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/CodeGuard$(E),$(OBJBINDIR))
endif
	$(call cp,ecere/obj/vanilla.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/libecereVanilla$(A),$(OBJLIBDIR))

#TODO: Samples?
install: actualinstall
	@$(call echo,The Ecere SDK has been installed.)

copyonlyinstall: actualinstall
	@$(call echo,The Ecere SDK has been installed. copyonlyinstall.)

actualinstall:
ifdef WINDOWS_TARGET
	$(call mkdir,$(call path,$(BINDIR)/))
	$(call mkdir,$(call path,$(DESTSLIBDIR)/))
	$(call mkdir,$(call path,$(DOCDIR)/))
	$(call cp,$(OBJBINDIR)$(LP)ecere$(SO),"$(DESTLIBDIR)/")
	$(call cp,$(OBJBINDIR)$(LP)ecereCOM$(SO),"$(DESTLIBDIR)/")
	$(call cp,$(OBJBINDIR)$(LP)ec$(SO),"$(DESTLIBDIR)/")
	$(call cp,$(OBJBINDIR)$(LP)ec2$(SO),"$(DESTLIBDIR)/")
	$(call cp,$(OBJBINDIR)$(LP)EDA$(SO),"$(DESTLIBDIR)/")
ifdef EDAdBASE
	$(call cp,$(OBJBINDIR)$(LP)EDAdBASE$(SO),"$(DESTLIBDIR)/")
endif
ifdef EDASQLite
	$(call cp,$(OBJBINDIR)$(LP)EDASQLite$(SO),"$(DESTLIBDIR)/")
endif
ifdef EDASQLiteCipher
	$(call cp,$(OBJBINDIR)$(LP)EDASQLiteCipher$(SO),"$(DESTLIBDIR)/")
endif
ifneq ($(ECERE_AUDIO),n)
	$(call cp,$(OBJBINDIR)$(LP)EcereAudio$(SO),"$(DESTLIBDIR)/")
endif
	$(call cp,$(OBJBINDIR)ecere-ide$(E),"$(BINDIR)/")
	$(call cp,$(OBJBINDIR)ear$(B32_SFX)$(E),"$(BINDIR)/")
	$(call cp,$(OBJBINDIR)ecc$(B32_SFX)$(E),"$(BINDIR)/")
	$(call cp,$(OBJBINDIR)ecp$(B32_SFX)$(E),"$(BINDIR)/")
	$(call cp,$(OBJBINDIR)ecs$(B32_SFX)$(E),"$(BINDIR)/")
	$(call cp,$(OBJBINDIR)epj2make$(E),"$(BINDIR)/")
	$(call cp,$(OBJBINDIR)bgen$(E),"$(BINDIR)/")
	$(call cp,$(OBJBINDIR)documentor$(E),"$(BINDIR)/")
ifdef CodeGuard
	$(call cp,$(OBJBINDIR)CodeGuard$(E),"$(BINDIR)/")
endif
	$(call cp,$(OBJLIBDIR)libecereVanilla$(A),"$(DESTSLIBDIR)/")
	$(call cp,doc/tao.pdf,"$(DOCDIR)/Ecere Tao of Programming [work in progress].pdf") || echo "The Ecere Tao of Programming is available at http://ecere.com/tao.pdf"
	$(call cpr,$(DOC)/ecereCOM,"$(DOCDIR)/ecereCOM")
	$(call cpr,$(DOC)/ecere,"$(DOCDIR)/ecere")
	$(call cpr,$(DOC)/EDA,"$(DOCDIR)/EDA")
endif

ifdef OSX_TARGET
	install $(OBJLIBDIR)$(LP)ecere$(SO) $(DESTLIBDIR)/
	install $(OBJLIBDIR)$(LP)ecereCOM$(SO) $(DESTLIBDIR)/
	install $(OBJLIBDIR)$(LP)ec$(SO) $(DESTLIBDIR)/
	install $(OBJLIBDIR)$(LP)ec2$(SO) $(DESTLIBDIR)/
	install $(OBJLIBDIR)$(LP)EDA$(SO) $(DESTLIBDIR)/
ifdef EDAdBASE
	install $(OBJLIBDIR)$(LP)EDAdBASE$(SO) $(DESTLIBDIR)/
endif
ifdef EDASQLite
	install $(OBJLIBDIR)$(LP)EDASQLite$(SO) $(DESTLIBDIR)/
endif
ifdef EDASQLiteCipher
	install $(OBJLIBDIR)$(LP)EDASQLiteCipher$(SO) $(DESTLIBDIR)/
endif
ifneq ($(ECERE_AUDIO),n)
	install $(OBJLIBDIR)$(LP)EcereAudio$(SO) $(DESTLIBDIR)/
endif
	install $(OBJBINDIR)ecere-ide$(E) $(BINDIR)/
	install $(OBJBINDIR)ear$(B32_SFX)$(E) $(BINDIR)/
	install $(OBJBINDIR)ecc$(B32_SFX)$(E) $(BINDIR)/
	install $(OBJBINDIR)ecp$(B32_SFX)$(E) $(BINDIR)/
	install $(OBJBINDIR)ecs$(B32_SFX)$(E) $(BINDIR)/
	install $(OBJBINDIR)epj2make$(E) $(BINDIR)/
	install $(OBJBINDIR)bgen$(E) $(BINDIR)/
	install $(OBJBINDIR)documentor$(E) $(BINDIR)/
ifdef CodeGuard
	install $(OBJBINDIR)CodeGuard$(E) $(BINDIR)/
endif
	install $(OBJLIBDIR)libecereVanilla$(A) $(DESTSLIBDIR)/
	install -d $(DOCDIR)/
	install doc/tao.pdf $(DOCDIR)/"Ecere Tao of Programming [work in progress].pdf" >/dev/null 2>&1 || echo "The Ecere Tao of Programming is available at http://ecere.com/tao.pdf"
	$(call cpr,$(DOC)/ecereCOM,"$(DOCDIR)/ecereCOM")
	$(call cpr,$(DOC)/ecere,"$(DOCDIR)/ecere")
	$(call cpr,$(DOC)/EDA,"$(DOCDIR)/EDA")
	mkdir -p $(MANDIR)/man1
	$(call cpr,share/man/man1,$(MANDIR)/man1)
	mkdir -p $(SAMPLESDIR)
	$(call cpr,samples,$(SAMPLESDIR))
	find $(SAMPLESDIR) -type d -exec chmod 777 {} \;
	find $(DOCDIR) -type d -exec chmod 755 {} \;
	find $(DOCDIR) -type f -exec chmod 644 {} \;
	mkdir -p $(EXTRASDIR)
	$(call cpr,extras,$(EXTRASDIR))
endif

ifndef OSX_TARGET
ifndef WINDOWS_TARGET
ifdef LINUX_TARGET
	mkdir -p $(DESTLIBDIR)/ec
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)ecere$(SOV) $(DESTLIBDIR)/$(LP)ecere$(SOV)
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)ecereCOM$(SOV) $(DESTLIBDIR)/$(LP)ecereCOM$(SOV)
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)ec$(SOV) $(DESTLIBDIR)/ec/$(LP)ec$(SOV)
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)ec2$(SOV) $(DESTLIBDIR)/ec/$(LP)ec2$(SOV)
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)EDA$(SOV) $(DESTLIBDIR)/ec/$(LP)EDA$(SOV)
ifdef EDAdBASE
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)EDAdBASE$(SOV) $(DESTLIBDIR)/ec/$(LP)EDAdBASE$(SOV)
endif
ifdef EDASQLite
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)EDASQLite$(SOV) $(DESTLIBDIR)/ec/$(LP)EDASQLite$(SOV)
endif
ifdef EDASQLiteCipher
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)EDASQLiteCipher$(SOV) $(DESTLIBDIR)/ec/$(LP)EDASQLiteCipher$(SOV)
endif
ifneq ($(ECERE_AUDIO),n)
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)EcereAudio$(SO) $(DESTLIBDIR)/ec/$(LP)EcereAudio$(SOV)
endif
	ln -sf $(LP)ecere$(SOV) $(DESTLIBDIR)/$(LP)ecere$(SO).0
	ln -sf $(LP)ecereCOM$(SOV) $(DESTLIBDIR)/$(LP)ecereCOM$(SO).0
	ln -sf $(LP)ec$(SOV) $(DESTLIBDIR)/ec/$(LP)ec$(SO).0
	ln -sf $(LP)ec2$(SOV) $(DESTLIBDIR)/ec/$(LP)ec2$(SO).0
	ln -sf $(LP)EDA$(SOV) $(DESTLIBDIR)/ec/$(LP)EDA$(SO).0
ifdef EDAdBASE
	ln -sf $(LP)EDAdBASE$(SOV) $(DESTLIBDIR)/ec/$(LP)EDAdBASE$(SO).0
endif
ifdef EDASQLite
	ln -sf $(LP)EDASQLite$(SOV) $(DESTLIBDIR)/ec/$(LP)EDASQLite$(SO).0
endif
ifdef EDASQLiteCipher
	ln -sf $(LP)EDASQLiteCipher$(SOV) $(DESTLIBDIR)/ec/$(LP)EDASQLiteCipher$(SO).0
endif
ifneq ($(ECERE_AUDIO),n)
	ln -sf $(LP)EcereAudio$(SOV) $(DESTLIBDIR)/ec/$(LP)EcereAudio$(SO).0
endif
	ln -sf $(LP)ecere$(SOV) $(DESTLIBDIR)/$(LP)ecere$(SO)
	ln -sf $(LP)ecereCOM$(SOV) $(DESTLIBDIR)/$(LP)ecereCOM$(SO)
	ln -sf $(LP)ec$(SOV) $(DESTLIBDIR)/ec/$(LP)ec$(SO)
	ln -sf $(LP)ec2$(SOV) $(DESTLIBDIR)/ec/$(LP)ec2$(SO)
	ln -sf $(LP)EDA$(SOV) $(DESTLIBDIR)/ec/$(LP)EDA$(SO)
ifdef EDAdBASE
	ln -sf $(LP)EDAdBASE$(SOV) $(DESTLIBDIR)/ec/$(LP)EDAdBASE$(SO)
endif
ifdef EDASQLite
	ln -sf $(LP)EDASQLite$(SOV) $(DESTLIBDIR)/ec/$(LP)EDASQLite$(SO)
endif
	ln -sf ../$(LP)ecere$(SOV) $(DESTLIBDIR)/ec/$(LP)ecere$(SO)
	ln -sf ../$(LP)ecereCOM$(SOV) $(DESTLIBDIR)/ec/$(LP)ecereCOM$(SO)
ifdef EDASQLiteCipher
	ln -sf $(LP)EDASQLiteCipher$(SOV) $(DESTLIBDIR)/ec/$(LP)EDASQLiteCipher$(SO)
endif
ifneq ($(ECERE_AUDIO),n)
	ln -sf $(LP)EcereAudio$(SOV) $(DESTLIBDIR)/ec/$(LP)EcereAudio$(SO)
endif
ifndef BSD_HOST
	install $(INSTALL_FLAGS) -m 644 share/pixmaps/ecere.png $(DESTDIR)$(prefix)/share/pixmaps/ecere.png
	install $(INSTALL_FLAGS) -m 644 share/applications/ecere.desktop $(DESTDIR)$(prefix)/share/applications/ecere.desktop
endif
else
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)ecere$(SO) $(DESTLIBDIR)/$(LP)ecere$(SO)
	install $(INSTALL_FLAGS) $(OBJLIBDIR)$(LP)ecereCOM$(SO) $(DESTLIBDIR)/$(LP)ecereCOM$(SO)
endif
	install $(INSTALL_FLAGS) $(OBJBINDIR)ecere-ide$(E) $(BINDIR)/ecere-ide$(E)
	install $(INSTALL_FLAGS) $(OBJBINDIR)ear$(B32_SFX)$(E) $(BINDIR)/ear$(B32_SFX)$(E)
	install $(INSTALL_FLAGS) $(OBJBINDIR)ecc$(B32_SFX)$(E) $(BINDIR)/ecc$(B32_SFX)$(E)
	install $(INSTALL_FLAGS) $(OBJBINDIR)ecp$(B32_SFX)$(E) $(BINDIR)/ecp$(B32_SFX)$(E)
	install $(INSTALL_FLAGS) $(OBJBINDIR)ecs$(B32_SFX)$(E) $(BINDIR)/ecs$(B32_SFX)$(E)
	install $(INSTALL_FLAGS) $(OBJBINDIR)epj2make$(E) $(BINDIR)/epj2make$(E)
	install $(INSTALL_FLAGS) $(OBJBINDIR)bgen$(E) $(BINDIR)/bgen$(E)
	install $(INSTALL_FLAGS) $(OBJBINDIR)documentor$(E) $(BINDIR)/documentor$(E)
ifdef CodeGuard
	install $(INSTALL_FLAGS) $(OBJBINDIR)CodeGuard$(E) $(BINDIR)/CodeGuard$(E)
endif
	install $(INSTALL_FLAGS) $(OBJLIBDIR)libecereVanilla$(A) $(DESTSLIBDIR)/libecereVanilla$(A)
ifdef BSD_HOST
	install $(INSTALL_FLAGS) -d $(DOCDIR)
endif
	install $(INSTALL_FLAGS) -m 644 doc/tao.pdf $(DOCDIR)/"Ecere Tao of Programming [work in progress].pdf" >/dev/null 2>&1 || echo "The Ecere Tao of Programming is available at http://ecere.com/tao.pdf"
	$(call cpr,$(DOC)/ecereCOM,"$(DOCDIR)/ecereCOM")
	$(call cpr,$(DOC)/ecere,"$(DOCDIR)/ecere")
	$(call cpr,$(DOC)/EDA,"$(DOCDIR)/EDA")
	mkdir -p $(MANDIR)/man1
	cp -pRf share/man/man1/* $(MANDIR)/man1
	mkdir -p $(SAMPLESDIR)
	cp -pRf samples/* $(SAMPLESDIR)
	find $(SAMPLESDIR) -type d -exec chmod 777 {} \;
	find $(DOCDIR) -type d -exec chmod 755 {} \;
	find $(DOCDIR) -type f -exec chmod 644 {} \;
	mkdir -p $(EXTRASDIR)
	cp $(CPFLAGS) extras/* $(EXTRASDIR)
ifdef DEBIAN_PACKAGE
	mkdir -p $(DESTDIR)$(prefix)/share/doc/libecere0
	install $(INSTALL_FLAG) -m644 NEWS $(DESTDIR)$(prefix)/share/doc/libecere0/changelog
	gzip -n -f -9 $(DESTDIR)$(prefix)/share/doc/libecere0/changelog
	mkdir -p $(DESTDIR)$(prefix)/share/doc/ecere-dev
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/ecere-dev/
	mkdir -p $(DESTDIR)$(prefix)/share/doc/ecere-extras
	cp $(DESTDIR)$(prefix)/share/doc/libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/ecere-extras/
	mkdir -p $(DESTDIR)$(prefix)/share/doc/ecere-samples
	cp $(DESTDIR)$(prefix)/share/doc/libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/ecere-samples/
	mkdir -p $(DESTDIR)$(prefix)/share/doc/ecere-sdk
	cp $(DESTDIR)$(prefix)/share/doc/libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/ecere-sdk/
	mkdir -p $(DESTDIR)$(prefix)/share/doc/libecc0
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/libecc0/
	mkdir -p $(DESTDIR)$(prefix)/share/doc/libecc2
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/libecc2/
	mkdir -p $(DESTDIR)$(prefix)/share/doc/libecerecom0
	cp $(DESTDIR)$(prefix)/share/doc/libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/libecerecom0/
	mkdir -p $(DESTDIR)$(prefix)/share/doc/libeda0
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/libeda0/
	# todo or not? add edadbase and edasqlitecipher?
	mkdir -p $(DESTDIR)$(prefix)/share/doc/libedasqlite0
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/libedasqlite0/
	mkdir -p $(DESTDIR)$(prefix)/share/doc/libecereaudio0
	ln -sf ../libecere0/changelog.gz $(DESTDIR)$(prefix)/share/doc/libecereaudio0/
endif
endif
endif

uninstall:
	$(call rm,"$(DESTLIBDIR)/$(LP)ecere$(SO)")
	$(call rm,"$(DESTLIBDIR)/$(LP)ecereCOM$(SO)")
	$(call rm,"$(DESTLIBDIR)/$(LP)ec$(SO)")
	$(call rm,"$(DESTLIBDIR)/$(LP)ec2$(SO)")
	$(call rm,"$(DESTLIBDIR)/$(LP)EDA$(SO)")
ifdef LINUX_TARGET
ifdef EDAdBASE
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)EDAdBASE$(SO)")
endif
ifdef EDASQLite
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)EDASQLite$(SO)")
endif
ifdef EDASQLiteCipher
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)EDASQLiteCipher$(SO)")
endif
ifneq ($(ECERE_AUDIO),n)
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)EcereAudio$(SO)")
endif
else
ifdef EDAdBASE
	$(call rm,"$(DESTLIBDIR)/$(LP)EDAdBASE$(SO)")
endif
ifdef EDASQLite
	$(call rm,"$(DESTLIBDIR)/$(LP)EDASQLite$(SO)")
endif
ifdef EDASQLiteCipher
	$(call rm,"$(DESTLIBDIR)/$(LP)EDASQLiteCipher$(SO)")
endif
ifneq ($(ECERE_AUDIO),n)
	$(call rm,"$(DESTLIBDIR)/$(LP)EcereAudio$(SO)")
endif
endif
	$(call rm,"$(BINDIR)/ecere-ide$(E)")
	$(call rm,"$(BINDIR)/ear$(B32_SFX)$(E)")
	$(call rm,"$(BINDIR)/ecc$(B32_SFX)$(E)")
	$(call rm,"$(BINDIR)/ecp$(B32_SFX)$(E)")
	$(call rm,"$(BINDIR)/ecs$(B32_SFX)$(E)")
	$(call rm,"$(BINDIR)/epj2make$(E)")
	$(call rm,"$(BINDIR)/bgen$(E)")
	$(call rm,"$(BINDIR)/documentor$(E)")
ifdef CodeGuard
	$(call rm,"$(BINDIR)/CodeGuard$(E)")
endif
	$(call rm,"$(DESTSLIBDIR)/libecereVanilla$(A)")
	$(call rm,"$(DOCDIR)/Ecere Tao of Programming [work in progress].pdf")
	$(call rm,"$(DOCDIR)/ecere.eCdoc")
	$(call rm,"$(DOCDIR)/ecereCOM.eCdoc")
	$(call rm,"$(DOCDIR)/EDA.eCdoc")
	$(call rmr,"$(DOCDIR)/ecere")
	$(call rmr,"$(DOCDIR)/ecereCOM")
	$(call rmr,"$(DOCDIR)/EDA")
ifdef LINUX_TARGET
	$(call rm,"$(DESTLIBDIR)/$(LP)ecere$(SO).0")
	$(call rm,"$(DESTLIBDIR)/$(LP)ecereCOM$(SO).0")
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)ec$(SO).0")
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)EDA$(SO).0")
ifdef EDAdBASE
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)EDAdBASE$(SO).0")
endif
ifdef EDASQLite
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)EDASQLite$(SO).0")
endif
ifdef EDASQLiteCipher
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)EDASQLiteCipher$(SO).0")
endif
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)EcereaAudio$(SO).0")
	$(call rm,"$(DESTLIBDIR)/$(LP)ecere$(SOV)")
	$(call rm,"$(DESTLIBDIR)/$(LP)ecereCOM$(SOV)")
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)ec$(SOV)")
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)ec2$(SOV)")
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)EDA$(SOV)")
ifdef EDAdBASE
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)EDAdBASE$(SOV)")
endif
ifdef EDASQLite
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)EDASQLite$(SOV)")
endif
ifdef EDASQLiteCipher
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)EDASQLiteCipher$(SOV)")
endif
ifneq ($(ECERE_AUDIO),n)
	$(call rm,"$(DESTLIBDIR)/ec/$(LP)EcereAudio$(SOV)")
endif
	$(call rm,"$(DESTDIR)$(prefix)/share/pixmaps/ecere.png")
	$(call rm,"$(DESTDIR)$(prefix)/share/applications/ecere.desktop")
endif
	$(call rmdir,"$(BINDIR)/")
	$(call rmdir,"$(DESTLIBDIR)/")
	$(call rmdir,"$(DESTSLIBDIR)/")
	$(call rmdir,"$(DOCDIR)/")
ifdef WINDOWS_TARGET
	$(call rmdir,"$(DESTDIR)/")
endif
	@$(call echo,The Ecere SDK has been uninstalled.)

regenbootstrap: update_ecere update_libec update_ecp update_ecc update_ecs
	@echo Bootstrap regenerated.

updatebootstrap: regenbootstrap
	@echo Copying files...
	$(call cp,ecere/obj/bootstrap.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/*.c,compiler/bootstrap/ecere/bootstrap)
	$(call cp,compiler/libec/obj/bootstrap.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/*.c,compiler/bootstrap/libec/bootstrap)
	$(call cp,compiler/ecp/obj/bootstrap.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/*.c,compiler/bootstrap/ecp/bootstrap)
	$(call cp,compiler/ecc/obj/bootstrap.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/*.c,compiler/bootstrap/ecc/bootstrap)
	$(call cp,compiler/ecs/obj/bootstrap.$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/*.c,compiler/bootstrap/ecs/bootstrap)
	@echo Bootstrap updated.

update_ecere:
	@echo Regenerating ecere bootstrapper...
	+cd ecere && $(_MAKE) -f Makefile.bootstrap clean
	+cd ecere && $(_MAKE) -f Makefile.bootstrap

update_libec:
	@echo Regenerating ec bootstrapper...
	+cd compiler/libec && $(_MAKE) -f Makefile.bootstrap clean
	+cd compiler/libec && $(_MAKE) -f Makefile.bootstrap

update_ecp:
	@echo Regenerating ecp bootstrapper...
	+cd compiler/ecp && $(_MAKE) -f Makefile.bootstrap clean
	+cd compiler/ecp && $(_MAKE) -f Makefile.bootstrap

update_ecc:
	@echo Regenerating ecc bootstrapper...
	+cd compiler/ecc && $(_MAKE) -f Makefile.bootstrap clean
	+cd compiler/ecc && $(_MAKE) -f Makefile.bootstrap

update_ecs:
	@echo Regenerating ecs bootstrapper...
	+cd compiler/ecs && $(_MAKE) -f Makefile.bootstrap clean
	+cd compiler/ecs && $(_MAKE) -f Makefile.bootstrap

troubleshoot:
	@$(call echo,Printing values of some variables.)
	@$(call echo,_CF_DIR=$(_CF_DIR))
	@$(call echo,HOST_PLATFORM=$(HOST_PLATFORM))
	@$(call echo,TARGET_PLATFORM=$(TARGET_PLATFORM))
	@$(call echo,PLATFORM=$(PLATFORM))
	@$(call echo,LINUX_HOST=$(LINUX_HOST))
	@$(call echo,LINUX_TARGET=$(LINUX_TARGET))
	@$(call echo,OSX_HOST=$(OSX_HOST))
	@$(call echo,OSX_TARGET=$(OSX_TARGET))
	@$(call echo,WINDOWS_HOST=$(WINDOWS_HOST))
	@$(call echo,WINDOWS_TARGET=$(WINDOWS_TARGET))
	@$(call echo,BSD_HOST=$(BSD_HOST))
	@$(call echo,BSD_TARGET=$(BSD_TARGET))
	@$(call echo,OS=$(OS))
	@$(call echo,OSTYPE=$(OSTYPE))
	@$(call echo,BASH=$(BASH))
	@$(call echo,TERM=$(TERM))
	@$(call echo,SHELL=$(SHELL))
	@$(call echo,WIN_SHELL_COMMANDS=$(WIN_SHELL_COMMANDS))
	@$(call echo,WIN_PS_TOOLS=$(WIN_PS_TOOLS))
	@$(call echo,CCACHE=$(CCACHE))
	@$(call echo,CCACHE_COMPILE=$(CCACHE_COMPILE))
	@$(call echo,CCACHE_PREFIX=$(CCACHE_PREFIX))
	@$(call echo,DISTCC=$(DISTCC))
	@$(call echo,GCC_PREFIX=$(GCC_PREFIX))
	@$(call echo,CC=$(CC))
	@$(call echo,CPP=$(CPP))
	@$(call echo,ECP=$(ECP))
	@$(call echo,ECC=$(ECC))
	@$(call echo,ECS=$(ECS))
	@$(call echo,EAR=$(EAR))
	@$(call echo,AS=$(AS))
	@$(call echo,LD=$(LD))
	@$(call echo,AR=$(AR))
	@$(call echo,STRIP=$(STRIP))
	@$(call echo,UPX=$(UPX))
	@$(call echo,TARGET_ARCH=$(TARGET_ARCH))
	@$(call echo,DESTDIR=$(DESTDIR))
	@$(call echo,PREFIXLIBDIR=$(PREFIXLIBDIR))
	@$(call echo,ARCH=$(ARCH))
	@$(call echo,ARCH_FLAGS=$(ARCH_FLAGS))
	@$(call echo,GIT_REPOSITORY=$(GIT_REPOSITORY))
	@$(call echo,DIR_VER=$(DIR_VER))
	@$(call echo,REPOSITORY_VER=$(REPOSITORY_VER))
	@$(call echo,CPPFLAGS=$(CPPFLAGS))
	@$(call echo,OPENSSL_CONF=$(OPENSSL_CONF))
	@$(call echo,OPENSSL_INCLUDE_DIR=$(OPENSSL_INCLUDE_DIR))
	@$(call echo,OPENSSL_LIB_DIR=$(OPENSSL_LIB_DIR))
	@$(call echo,OPENSSL_BIN_DIR=$(OPENSSL_BIN_DIR))
	@$(call echo,ROOT_ABSPATH=$(ROOT_ABSPATH))
	@$(call echo,DYLD_LIBRARY_PATH=$(DYLD_LIBRARY_PATH))
